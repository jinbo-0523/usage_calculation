class Shop < ApplicationRecord
  belongs_to :brand
  has_many :amounts, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
end
