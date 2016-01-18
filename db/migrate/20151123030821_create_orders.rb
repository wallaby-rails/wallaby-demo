class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string    :customer
      t.datetime  :ordered_at
    end

    create_table :order_items do |t|
      t.integer   :order_id
      t.integer   :product_id
      t.integer   :quantity
      t.float     :price
      t.float     :total
    end

    add_index :order_items, :order_id
    add_index :order_items, :product_id
  end
end
