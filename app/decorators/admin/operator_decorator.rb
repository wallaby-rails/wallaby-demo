class Admin::OperatorDecorator < Admin::UserDecorator
  self.form_field_names = [:email, :type, :password, :password_confirmation]
  form_fields[:password] = { type: 'password', label: 'Password' }
  form_fields[:password_confirmation] = { type: 'password', label: 'Confirm Password' }
end
