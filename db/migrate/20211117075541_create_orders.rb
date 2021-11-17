class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :status
      t.integer :payment_method
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :postage
      t.integer :total_price
    end
  end
end
