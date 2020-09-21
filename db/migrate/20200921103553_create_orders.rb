class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :order, null: false, default: "0"
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
