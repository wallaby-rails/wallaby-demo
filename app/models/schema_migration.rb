# The `schema_migrations` table uses a string primary key (`version`) instead of
# an `id` column. It is exposed here so the admin home page can demonstrate how
# Wallaby handles models with a non-standard primary key.
#
# NOTE: Rails 8.0+ replaced the former `ActiveRecord::SchemaMigration` model
# (an `ActiveRecord::Base` descendant) with a plain class, so it can no longer
# be passed to Wallaby helpers.
class SchemaMigration < ApplicationRecord
  self.table_name = 'schema_migrations'
  self.primary_key = 'version'
end
