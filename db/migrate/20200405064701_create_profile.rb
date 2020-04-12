class CreateProfile < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :nickname
      t.text :bio
    end
  end
end
