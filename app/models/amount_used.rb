class AmountUsed < ApplicationRecord
  has_many :order
  belongs_to :user
  belongs_to :store
  validates :date, :sale, presence: true
end
