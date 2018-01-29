class OrderDecorator < Wallaby::ResourceDecorator
  def to_label
    order_number
  end
end
