require 'ffaker'
require 'open-uri'
require 'stringio'

PICTURE_URL = 'https://picsum.photos/100'.freeze

# Downloads a sample photo for the seeds. Remote hosts are not always reachable
# from build environments (picsum.photos answers HTTP 522 on Render), so fall
# back to a locally generated placeholder instead of aborting the deploy.
# Once a download fails the remaining pictures skip the network entirely.
def remote_picture_data(index)
  return if @remote_pictures_available == false

  URI.open("#{ PICTURE_URL }?random=#{ index }", open_timeout: 5, read_timeout: 10, &:read)
rescue StandardError => error
  @remote_pictures_available = false
  Rails.logger.warn "[seeds] Could not download a picture (#{ error.class }: #{ error.message }); using placeholders"
  nil
end

def seed_picture(index)
  if (data = remote_picture_data(index))
    return { io: StringIO.new(data), filename: "#{ FFaker::Name.name }.jpg", content_type: 'image/jpeg' }
  end

  background = %w[#4e73df #1cc88a #36b9cc #f6c23e #e74a3b #858796].fetch(index % 6)
  svg = <<~SVG
    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
      <rect width="100" height="100" fill="#{ background }"/>
      <circle cx="50" cy="36" r="15" fill="#ffffff" fill-opacity="0.85"/>
      <path d="M16 92 L40 54 L60 76 L72 62 L92 92 Z" fill="#ffffff" fill-opacity="0.85"/>
    </svg>
  SVG
  { io: StringIO.new(svg), filename: "#{ FFaker::Name.name }.svg", content_type: 'image/svg+xml' }
end

[ AllPostgresType, Category, Order, Order::Item, Picture, Product, Profile, Tag, User ].each do |model|
  ApplicationRecord.connection.execute("TRUNCATE #{ model.table_name } RESTART IDENTITY")
end
ApplicationRecord.connection.execute("TRUNCATE products_tags RESTART IDENTITY")

100.times do
  all_postgres_type = AllPostgresType.new
  all_postgres_type.string = FFaker::Name.name
  all_postgres_type.text = FFaker::Lorem.paragraph
  all_postgres_type.integer = rand 100
  all_postgres_type.float = rand(1000) / rand(10).to_f
  all_postgres_type.decimal = rand 10000
  all_postgres_type.datetime = FFaker::Time.date
  all_postgres_type.time = FFaker::Time.date
  all_postgres_type.date = FFaker::Time.date
  date = Time.zone.parse FFaker::Time.date.to_s
  all_postgres_type.daterange = date..(date + rand(10).days)
  all_postgres_type.numrange = rand(10)..(rand(100) + 10)
  date = Time.zone.parse FFaker::Time.date.to_s
  all_postgres_type.tsrange = date..(date + rand(10).days)
  date = Time.zone.parse FFaker::Time.date.to_s
  all_postgres_type.tstzrange = date..(date + rand(10).days)
  all_postgres_type.int4range = rand(10)..(rand(100) + 10)
  all_postgres_type.int8range = rand(10)..(rand(100) + 10)
  all_postgres_type.binary = nil
  all_postgres_type.boolean = [ true, false, nil ].sample
  all_postgres_type.bigint = 100
  # all_postgres_type.xml = "<text>#{ FFaker::Lorem.paragraph }</text>"
  all_postgres_type.tsvector =
  all_postgres_type.hstore = { 'system' => 'test' }
  all_postgres_type.inet = FFaker::Internet.ip_v4_address
  all_postgres_type.cidr = FFaker::Internet.ip_v4_address
  all_postgres_type.macaddr = 12.times.map{ '0123456789ABCDEF'[rand(16)] }.join('')
  all_postgres_type.uuid = FFaker::Guid.guid
  all_postgres_type.json = { 'system' => 'test' }.to_json
  all_postgres_type.jsonb = { 'system' => 'test' }.to_json
  all_postgres_type.ltree = "#{ FFaker::Lorem.word }.#{ FFaker::Lorem.word }.#{ FFaker::Lorem.word }"
  all_postgres_type.citext = FFaker::Lorem.paragraph
  all_postgres_type.point = [ rand(10), rand(10) ]
  all_postgres_type.bit = [ 0, 1 ].sample
  all_postgres_type.bit_varying = (1..(rand(5) + 1)).to_a.map{ [ 0, 1 ].sample }.join('')
  all_postgres_type.money = rand(99999999)
  all_postgres_type.save!
end

50.times do
  category = Category.new
  category.name = FFaker::Product.product.split(' ').sample
  category.save!
end

30.times do
  tag = Tag.new
  tag.name = FFaker::Product.product.split(' ').sample.downcase
  tag.save!
end

100.times do
  product = Product.new
  product.category = Category.all.sample
  product.tags = Tag.all.shuffle.first 3
  product.name = FFaker::Product.product_name
  product.sku = FFaker::Product.model
  product.description = FFaker::Lorem.paragraph
  product.stock = rand 100
  product.price = rand * 100
  product.featured = FFaker::Boolean.random
  product.available_to_date = FFaker::Time.date
  product.available_to_time = FFaker::Time.date
  product.published_at = FFaker::Time.date
  product.save!
end

products = Product.all

10.times do
  order = Order.new
  order.customer = FFaker::Name.name
  order.ordered_at = FFaker::Time.date
  order.order_number = "N#{order.ordered_at.to_fs(:number)}"
  order.save!

  product = products.sample
  rand(5).times do
    item = Order::Item.new
    item.order_id = order.id
    item.product_id = product.id
    item.quantity = rand(100)
    item.price = product.price
    item.total = item.quantity * item.price
    item.save!
  end
end

1.times do
  user = SuperUser.new
  user.email = 'admin@wallaby.rails'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
end

1.times do
  user = Operator.new
  user.email = 'operator@wallaby.rails'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
end

User.find_each do |user|
  user.create_profile(
    nickname: FFaker::Name.first_name,
    bio: FFaker::Lorem.paragraph
  )
end

# Pictures are seeded after the users so every imageable model has records to
# attach to (seeding them earlier left the User pictures unsaved).
18.times do |index|
  picture = Picture.new
  picture.name = FFaker::Name.name
  picture.imageable = [ Product, User, Category ].sample.all.sample
  picture.file.attach(**seed_picture(index))
  picture.save!
end
