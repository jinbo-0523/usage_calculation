class Recipe < ApplicationRecord
  belongs_to :brand
  belongs_to :order
  has_many :food_recipes
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true

end
