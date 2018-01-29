class UserDecorator < Wallaby::ResourceDecorator
  self.form_field_names = [:email, :type]
end
