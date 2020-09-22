class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name, null:false
      t.references :brand, null: false, foreign_key: true
      t.integer :amount, null:false
      t.boolean :display, null: false, default: true

      t.timestamps
    end
    add_index :recipes, :name, unique: true

  end
end
