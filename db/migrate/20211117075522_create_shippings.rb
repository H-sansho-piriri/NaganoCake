class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|

      t.timestamps
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address

    end
  end
end
