class Shop < ApplicationRecord
  belongs_to :brand
  has_many :amount_userd, dependent: :destroy
  
              # ↑複数形じゃなくて平気？
  validates :name, :number, presence: true, uniqueness: true
end
