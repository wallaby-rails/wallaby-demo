class RemoveProductDetails < ActiveRecord::Migration[4.2][5.1]
  def change
    drop_table :product_details, if_exists: true
    drop_table :people, if_exists: true

    add_column :users, :type, :string
    add_column :orders, :order_number, :string
  end
end
