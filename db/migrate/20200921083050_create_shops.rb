class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.references :brand, null: false, foreign_key: true
      t.boolean :display, null: false, default: true

      t.timestamps
    end
    add_index :shops, [:brand_id, :name ], unique: true
    add_index :shops, [:brand_id, :number], unique: true
  end
end