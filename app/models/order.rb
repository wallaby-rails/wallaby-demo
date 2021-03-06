class Order < ApplicationRecord
  has_many :items, class_name: Item.name
  has_many :products, through: :items

  def total
    items.sum(:total)
  end
end
