class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string  :name
      t.integer :imageable_id
      t.string  :imageable_type
      t.binary  :file
      t.timestamps null: false
    end

    add_index :pictures, [ :imageable_type, :imageable_id ]
  end
end
