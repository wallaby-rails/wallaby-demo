class ProductDecorator < Admin::ApplicationDecorator
  self.index_fields[:model] = { label: 'Model Name', type: 'string' }
  self.index_field_names = %w( id model featured tags )
  self.filters[:featured] = { default: true }
  self.filters[:published] = {
    label: 'Published',
    scope: -> { where.not published_at: nil }
  }

  def model
    "#{ name } - #{ sku }"
  end
end
