class Admin::Order::ItemDecorator < Admin::ApplicationDecorator
  index_field_names.insert(1, 'order')
  index_field_names.insert(2, 'product')

  def to_label
    "##{id} #{product.name}"
  end
end
