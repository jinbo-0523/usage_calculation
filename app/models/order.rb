class Order < ApplicationRecord
  attr_accessor :recipe_name
  belongs_to :report, optional: true
  belongs_to :recipe, optional: true
  validates :count,presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
