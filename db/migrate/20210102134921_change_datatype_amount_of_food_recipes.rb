class ChangeDatatypeAmountOfFoodRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :food_recipes, :amount, :float
  end
end
