module Admin
  # @see https://github.com/wallaby-rails/wallaby/blob/master/docs/controller.md
  class ApplicationController < Wallaby::ResourcesController
    # Mark current class as base/abstract
    base_class!

    # Specify the responder
    # self.responder = Wallaby::ResourcesResponder

    # Specify the theme_name
    # self.theme_name = 'admin/application'

    # Specify the engine name.
    # It should be the same as the option `:as` for mounting Wallaby::Engine
    # self.engine_name = 'wallaby_engine'

    # Specify the application/base decorator
    # self.application_decorator = Admin::ApplicationDecorator

    # Specify the application/base servicer
    # self.application_servicer = Admin::ApplicationServicer

    # Specify the application/base authorizer
    # self.application_authorizer = Admin::ApplicationAuthorizer

    # Specify the application/base paginator
    # self.application_paginator = Admin::ApplicationPaginator

    # Specify the models that Wallaby should handle.
    # NOTE: Once this is set, Wallaby will ignore `models_to_exclude` configuration
    # self.models = User

    # Specify the models that Wallaby should exclude.
    ::ActiveRecord::SchemaMigration
    self.models_to_exclude = []

    # Specify the logout url helper method name that Wallaby uses to log user out
    # self.logout_path = :logout_path

    # Specify the http verb for logging out a user
    # self.logout_method = :delete

    # Specify the method name that Wallaby uses to retrieve email from for user portrait display using gravatar.
    # self.email_method = :email

    # Specify the max number of characters to truncate for index page
    # self.max_text_length = 20

    # Specify the default page size for pagination on index page
    # config.page_size = 20

    # Specify the sorting strategy to use, and valid values are:
    #   :multiple - default value, allowing sorting on multiple columns
    #   :single - sorting is allowed only on one column
    # config.sorting_strategy = :single

    # Customize how to authenticate a user
    # def authenticate_wallaby_user!
    #   super # do something for all the subclasses
    # end

    # Customize how to return user record
    # def wallaby_user
    #   super # do something for all the subclasses
    # end

    # Customize landing page
    # def home
    #   super # do something for all the subclasses
    # end

    # Customize index page
    # def index
    #   # do something before the origin action
    #   index!(
    #     location: nil # where to redirect when successful
    #   ) do |format| # `respond_with` block
    #     # do something here before rendering
    #   end
    # end

    # Customize new page
    # def new
    #   # do something before the origin action
    #   new!(
    #     location: nil # where to redirect when successful
    #   ) do |format| # `respond_with` block
    #     # do something here before rendering
    #   end
    # end

    # Customize create action
    # def create
    #   # do something before the origin action
    #   create!(
    #     params: nil, # params to use for the servicer
    #     location: nil # where to redirect when successful
    #   ) do |format| # `respond_with` block
    #     # do something here before rendering
    #   end
    # end

    # Customize show page
    # def show
    #   # do something before the origin action
    #   show!(
    #     location: nil # where to redirect when successful
    #   ) do |format| # `respond_with` block
    #     # do something here before rendering
    #   end
    # end

    # Customize edit page
    # def edit
    #   # do something before the origin action
    #   edit!(
    #     location: nil # where to redirect when successful
    #   ) do |format| # `respond_with` block
    #     # do something here before rendering
    #   end
    # end

    # Customize update action
    # def update
    #   # do something before the origin action
    #   update!(
    #     params: nil, # params to use for the servicer
    #     location: nil # where to redirect when successful
    #   ) do |format| # `respond_with` block
    #     # do something here before rendering
    #   end
    # end

    # Customize destroy action
    # def destroy
    #   # do something before the origin action
    #   destroy!(
    #     params: nil, # params to use for the servicer
    #     location: nil # where to redirect when successful
    #   ) do |format| # `respond_with` block
    #     # do something here before rendering
    #   end
    # end

    # Customize what parameters to be white-listed for mass assignment
    # def resource_params
    #   super # something for all the subclasses
    # end

    # Customize how to return a collection
    # def collection
    #   collection!(
    #     params: nil, # params to use for the servicer
    #     paginate: true # whether to paginate the collection
    #   ) do |records|
    #     # do something here after origin query is completed
    #     # but before `@collection` instance variable is set
    #     records
    #   end
    # end

    # Customize how to return a resource
    # def resource
    #   resource!(
    #     find_params: nil, # params/options for servicer's `find` action
    #     new_params: nil # params/options for servicer's `new` action
    #   ) do |record|
    #     # do something here after origin query is completed
    #     # but before `@resource` instance variable is set
    #     record
    #   end
    # end
  end
end
