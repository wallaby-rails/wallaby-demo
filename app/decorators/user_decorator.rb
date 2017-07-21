class UserDecorator < Wallaby::ResourceDecorator
  self.show_fields[:email][:type] = 'email'
end
