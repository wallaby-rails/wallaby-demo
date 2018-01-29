class RemoveProductDetails < ActiveRecord::Migration[5.1]
  def change
    drop_table :product_details
    drop_table :people

    add_column :users, :type, :string
    add_column :orders, :order_number, :string
  end
end
