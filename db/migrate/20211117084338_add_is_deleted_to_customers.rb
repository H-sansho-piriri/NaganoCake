class AddIsDeletedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_deleted, :boolean, default: false, null: false
  end
end
