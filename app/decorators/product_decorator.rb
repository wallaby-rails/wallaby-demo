class ProductDecorator < Wallaby::ResourceDecorator
  self.index_fields['model'] = { label: 'Model Name', type: 'string' }
  self.index_field_names = %w( id model tags )

  def model
    "#{ name } - #{ sku }"
  end
end
