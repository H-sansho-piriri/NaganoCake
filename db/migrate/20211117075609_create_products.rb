class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.integer :category_id, null: false
      t.string :name, null: false
      t.text :caption, null: false
      t.integer :price, null: false
      t.string :image_id
      t.boolean :is_active, default: true, null: false
    end
  end
end
