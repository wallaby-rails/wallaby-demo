module Api
  class BlogsController < ActionController::API
    include Wallaby::ResourcesConcern
    self.responder = Wallaby::JsonApiResponder
    respond_to :json
  end
end
