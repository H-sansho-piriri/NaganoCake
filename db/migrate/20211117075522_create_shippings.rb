class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|

      t.timestamps
      t.integer :customer_id
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false

    end
  end
end
