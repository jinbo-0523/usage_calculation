class AmountUsed < ApplicationRecord
  has_many :order
  has_many :users
  belongs_to :store, optional: true
  validates :date, :sale, presence: true
end
