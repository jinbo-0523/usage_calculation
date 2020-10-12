class RemoveIndexToOrders < ActiveRecord::Migration[6.0]
  def up
    remove_index :orders, [:recipe_id, :count]
  end

  def down
    add_index :orders, [:recipe_id, :count], unique: true
  end
end
