class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.integer :category_id
      t.string :name
      t.text :caption
      t.integer :price
      t.string :image_id
      t.boolean :is_active, default: true, null: false
    end
  end
end
