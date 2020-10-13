class Report < ApplicationRecord
  belongs_to :user
  belongs_to :shop 
  has_many :orders, dependent: :destroy
  has_many :recipes, through: :orders

  accepts_nested_attributes_for :orders, allow_destroy: true
  
  validates :date, presence: true, uniqueness: { scope: :shop_id }
  validates :sale, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # [
  #   { 
  #     date: date,
  #     recipe_ids: [],
  #     amounts: []
  #   },
  #   ...
  # ]

  def self.list_of_food_recipes
    all.map do |report|
      recipe_list = []
      report.orders.each do |order|
        order.food_recipes.each do |food_recipe|
          recipe_list << [food_recipe.food_id, food_recipe.amount * order.count]
        end
      end
      results = recipe_list.group_by(&:first).map do |k, v|
        [k, v.map(&:last).sum]
      end
      {
        date: report.date,
        recipe_ids: results.map(&:first),
        amounts: results.map(&:last)
      }
    end
  end
end
