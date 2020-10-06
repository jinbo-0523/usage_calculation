class Recipe < ApplicationRecord
  belongs_to :brand
  has_many :orders
  has_many :food_recipes, dependent: :destroy
  has_many :foods, through: :food_recipes
  accepts_nested_attributes_for :food_recipes, allow_destroy: true, reject_if: :reject_recipe

  validates :name, presence: true, uniqueness: { scope: :brand_id }
  validates :display, inclusion: { in: [true, false] }
  def reject_recipe(attributes)
    attributes['food_id'].blank? && attributes['amonut'].blank?
  end

end
