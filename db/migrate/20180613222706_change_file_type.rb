class ChangeFileType < ActiveRecord::Migration[4.2][5.2]
  def change
    remove_column :pictures, :file
    add_column :pictures, :file, :string
  end
end
