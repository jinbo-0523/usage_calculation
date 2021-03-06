class CreateFoodRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :food_recipes do |t|
      t.references :food, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.integer :amount, null:false

      t.timestamps
    end
  end
end
