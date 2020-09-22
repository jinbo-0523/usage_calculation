class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name, null:false
      t.references :company, foreign_key: true
      t.boolean :display, null: false, default: true

      t.timestamps
    end
    add_index :brands, :name, unique: true
  end
end
