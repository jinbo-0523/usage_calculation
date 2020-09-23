class Recipe < ApplicationRecord
  belongs_to :brand
  has_many :orders
  has_many :food_recipes
  
  validates :name, presence: true, uniqueness: { scope: :brand_id }
  validates :display, inclusion: { in: [true, false] }
end
