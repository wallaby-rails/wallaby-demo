class OrderDecorator < Admin::ApplicationDecorator
  def to_label
    order_number
  end
end
