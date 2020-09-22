class Amount < ApplicationRecord
  belongs_to :order
  belongs_to :user
  belongs_to :shop
  validates :date, presence: true
  validates :sale, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
