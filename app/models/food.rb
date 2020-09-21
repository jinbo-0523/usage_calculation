class Food < ApplicationRecord
  has_many :food_recipes
            # ↑複数形？
  validates :name, presence: true, uniqueness: true
  validates :total, presence: true
  validates :unit, presence: true

end
