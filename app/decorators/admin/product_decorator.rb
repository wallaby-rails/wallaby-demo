class Admin::ProductDecorator < Admin::ApplicationDecorator
  index_fields[:model] = { label: 'Model Name', type: 'string' }
  self.index_field_names = %w(id model name sku stock price featured)
  filters[:featured] = { default: true }
  filters[:published] = {
    label: 'Published',
    scope: -> { where.not published_at: nil }
  }

  def model
    "#{ name } - #{ sku }"
  end
end
