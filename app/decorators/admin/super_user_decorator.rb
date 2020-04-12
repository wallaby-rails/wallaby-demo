class Admin::SuperUserDecorator < Admin::UserDecorator
  self.form_field_names = [:email, :type]
end
