class Rank < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :company
  validates :name, presence: true, uniqueness: true
  validates :display, inclusion: { in: [true, false] }
end

