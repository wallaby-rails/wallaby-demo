class RemoveProductDetails < ActiveRecord::Migration[4.2][5.1]
  disable_ddl_transaction!

  def change
    drop_table :product_details, if_exists: true
    drop_table :people, if_exists: true

    add_column :users, :type, :string, if_not_exists: true
    add_column :orders, :order_number, :string, if_not_exists: true
  end
end
