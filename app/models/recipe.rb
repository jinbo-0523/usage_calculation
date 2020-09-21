class Recipe < ApplicationRecord
  belongs_to :brand
  belongs_to :order
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true

end
