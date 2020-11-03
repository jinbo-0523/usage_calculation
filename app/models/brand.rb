class Brand < ApplicationRecord
  belongs_to :company
  has_many :shops, dependent: :destroy
  has_many :recipes, dependent: :destroy
  # brand.display_recipes と brand.recipes.where(display: true).order(:id) が同じでdisplay:trueの物を取得
  has_many :display_recipes, -> { where(display: true).order(id: :asc) }, class_name: "Recipe", dependent: :destroy

  # has_many :display_food_recipes, -> { order(food_id: :asc) }, through: :display_recipes, source: :food_recipes
  # 上で作った各display:trueレシピで使ってる食材をそれぞれ取得。この時レシピ毎に取得しているのでfood_idが123,234,567,234みたいにバラバラ状態
  # コントローラーでwhereを使ってるので問題なく使える
  has_many :display_food_recipes, through: :display_recipes, source: :food_recipes

  validates :name, presence: true, uniqueness: { scope: :company_id }
  validates :display, inclusion: { in: [true, false] }
end
