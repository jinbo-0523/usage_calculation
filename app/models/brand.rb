class Brand < ApplicationRecord
  belongs_to :company
  has_many :shops, dependent: :destroy
  has_many :recipes, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :display, inclusion: { in: [true, false] }
end
