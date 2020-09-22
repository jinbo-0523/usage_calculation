class Order < ApplicationRecord
  has_many :amounts, optional: true
  has_many :recipes
  validates :order,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
