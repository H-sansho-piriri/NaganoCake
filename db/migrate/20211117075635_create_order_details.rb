class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity, null: false
      t.integer :making_status, default: 0, null: false
      t.integer :price, null: false
      
      t.timestamps
    end
  end
end
