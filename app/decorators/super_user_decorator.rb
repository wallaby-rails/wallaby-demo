class SuperUserDecorator < Admin::ApplicationDecorator
  self.form_field_names = [:email, :type]
end
