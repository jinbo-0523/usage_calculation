class FoodRecipe < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :food_id, uniqueness: { scope: :recipe_id }
end
