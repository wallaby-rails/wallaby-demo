[ Category, Tag, Product, User ].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{ model.table_name } RESTART IDENTITY")
end

10.times.each do
  category = Category.new
  category.name = FFaker::Name.name
  category.save!
end

10.times.each do
  tag = Tag.new
  tag.name = FFaker::Name.name
  tag.save!
end

100.times.each do
  product = Product.new
  product.category = Category.all.sample
  product.tags = Tag.all.shuffle.first 3
  product.name = FFaker::Name.name
  product.sku = FFaker::Guid.guid
  product.description = FFaker::Lorem.paragraph
  product.stock = rand 100
  product.price = rand * 100
  product.featured = FFaker::Boolean.random
  product.available_to_date = FFaker::Time.date
  product.available_to_time = FFaker::Time.date
  product.published_at = FFaker::Time.date
  product.save!
  details = product.build_product_detail
  details.meta_data = FFaker::Lorem.paragraph
  details.save!
end

1.times.each do
  user = User.new
  user.email = 'tian@example.com'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
end