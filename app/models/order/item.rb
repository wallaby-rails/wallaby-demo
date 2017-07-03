class Order::Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  has_one :product_detail, through: :product
end
