class UserDecorator < Admin::ApplicationDecorator
  self.form_field_names = [:email, :type]
end
