class Brand < ApplicationRecord
  belongs_to :company
  has_many :shops, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :display_recipes, -> { where(display: true).order(id: :asc) }, class_name: "Recipe", dependent: :destroy

  has_many :display_food_recipes, -> { order(food_id: :asc) }, through: :display_recipes, source: :food_recipes

  validates :name, presence: true, uniqueness: { scope: :company_id }
  validates :display, inclusion: { in: [true, false] }

  def display_food_ids
    display_food_recipes.pluck(:food_id).uniq
  end
end
