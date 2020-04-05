# configuration for wallaby
Wallaby.config do |config|
  config.features.turbolinks_enabled = true
  ActiveRecord::SchemaMigration
  config.models.exclude []
end
