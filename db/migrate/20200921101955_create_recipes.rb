class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name, null:false, unique:true
      t.references :brand, null: false, foreign_key: true
      t.integer :amount, null:false

      t.timestamps
    end
  end
end
