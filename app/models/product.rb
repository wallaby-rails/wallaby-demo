class Product < ActiveRecord::Base
  has_one :product_detail
  belongs_to :category
  has_and_belongs_to_many :tags
end