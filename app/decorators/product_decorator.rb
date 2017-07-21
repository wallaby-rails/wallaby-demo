class ProductDecorator < Wallaby::ResourceDecorator
  self.index_fields['model'] = { label: 'Model Name', type: 'string' }
  self.index_field_names = %w( id model featured tags )
  self.filters[:featured] = {
    label: 'Featured',
    scope: -> { where(featured: false) }
  }

  def model
    "#{ name } - #{ sku }"
  end
end
