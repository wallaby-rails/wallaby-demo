class Product < ActiveRecord::Base
  has_one :product_detail
  has_one :picture, as: :imageable
  has_many :items, class_name: Order::Item.name
  has_many :orders, through: :items
  belongs_to :category
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :some_tags, -> { where name: [ 'Video Case', 'Direct Viewer' ] }, class_name: Tag.name

  validates_presence_of :name, :sku
end
