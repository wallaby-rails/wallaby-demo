class AddPerson < ActiveRecord::Migration[4.2][5.0]
  def change
    create_table :people do |t|
      t.column :type, :string
    end
  end
end
