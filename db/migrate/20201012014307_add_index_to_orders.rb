class AddIndexToOrders < ActiveRecord::Migration[6.0]
  def change
    add_index :orders, [:recipe_id, :report_id], unique: true
  end
end
