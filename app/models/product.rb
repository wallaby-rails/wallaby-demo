class Product < ApplicationRecord
  has_one :picture, as: :imageable
  has_many :items, class_name: Order::Item.name
  has_many :orders, through: :items
  belongs_to :category
  has_and_belongs_to_many :tags
  scope :featured, -> { where(featured: true) }

  validates_presence_of :name, :sku
end
