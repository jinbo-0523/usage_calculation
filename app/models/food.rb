class Food < ApplicationRecord
  has_many :food_recipes
  validates :name, presence: true, uniqueness: true
  validates :total, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit, presence: true
  validates :display, inclusion: { in: [true, false] }
end
