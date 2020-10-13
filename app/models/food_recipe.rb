class FoodRecipe < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
  belongs_to :order, primary_key: :recipe_id, foreign_key: :recipe_id
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :food_id, uniqueness: { scope: :recipe_id }
end
