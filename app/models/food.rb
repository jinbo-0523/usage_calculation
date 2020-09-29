class Food < ApplicationRecord
  has_many :food_recipes
  belongs_to :company
  has_many :recipes, through: :food_recipes
  validates :name, presence: true, uniqueness: { scope: :company_id }
  validates :total, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit, presence: true
  validates :display, inclusion: { in: [true, false] }
end
