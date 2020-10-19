class AddIndexToShops < ActiveRecord::Migration[6.0]
  def up
    remove_index :shops, [:brand_id, :number]
  end

  def down
    add_index :shops, [:brand_id, :number], unique: true
  end
end
