class Admin::ApplicationController < Wallaby::ResourcesController
  base_class!

  ActiveRecord::SchemaMigration # preload this class
  self.models_to_exclude = []
end
