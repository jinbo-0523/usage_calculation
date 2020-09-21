class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false, unique: true
      t.integer :number, null: false, unique: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end