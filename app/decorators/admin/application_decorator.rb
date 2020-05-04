module Admin
  # @see https://github.com/wallaby-rails/wallaby/blob/master/docs/decorator.md
  class ApplicationDecorator < Wallaby::ResourceDecorator
    # Mark current class as base/abstract
    base_class!
  end
end
