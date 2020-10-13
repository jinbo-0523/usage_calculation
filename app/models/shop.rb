class Shop < ApplicationRecord
  belongs_to :brand
  has_many :reports, dependent: :destroy
  
  # has_many :

  validates :name, presence: true, uniqueness: { scope: :brand_id }
  validates :number, presence: true, uniqueness:  { scope: :brand_id }, numericality: { only_integer: true, greater_than: 0 }
end
