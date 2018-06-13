class OperatorDecorator < Admin::ApplicationDecorator
  self.form_field_names = [:email, :type, :password, :password_confirmation]
  self.form_fields[:password] = { type: 'password', label: 'Password' }
  self.form_fields[:password_confirmation] = { type: 'password', label: 'Confirm Password' }
end
