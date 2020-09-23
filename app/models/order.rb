class Order < ApplicationRecord
  belongs_to :report, optional: true
  belongs_to :recipe, optional: true

  validates :order,presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, uniqueness: { scope: :recipe_id }
end
