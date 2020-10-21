class Order < ApplicationRecord
  belongs_to :report
  belongs_to :recipe
  has_many :food_recipes, primary_key: :recipe_id, foreign_key: :recipe_id
  validates :count,presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
