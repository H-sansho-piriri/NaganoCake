class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :status, null: false
      t.integer :payment_method, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :postage, null: false
      t.integer :total_price, null: false
    end
  end
end
