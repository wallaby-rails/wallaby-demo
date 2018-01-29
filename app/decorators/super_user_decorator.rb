class SuperUserDecorator < Wallaby::ResourceDecorator
  self.form_field_names = [:email, :type]
end
