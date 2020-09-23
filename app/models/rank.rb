class Rank < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :company
  validates :name, presence: true, uniqueness: { scope: :company_id }
  validates :display, inclusion: { in: [true, false] }
end

