class Recipe < ApplicationRecord
  belongs_to :brand
  belongs_to :order
  has_many :food_recipes
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :display, inclusion: { in: [true, false] }
end
