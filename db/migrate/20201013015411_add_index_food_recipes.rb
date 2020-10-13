class AddIndexFoodRecipes < ActiveRecord::Migration[6.0]
  def change
    add_index :food_recipes, [:food_id, :recipe_id], unique: true
  end
end
