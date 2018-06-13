class PictureDecorator < Admin::ApplicationDecorator
  self.form_fields[:file][:type] = 'file'
  self.index_fields[:file][:type] = 'active_storage'
  self.show_fields[:file][:type] = 'active_storage'
  self.show_field_names.delete 'file_blob'
  self.show_field_names.delete 'file_attachment'
end
