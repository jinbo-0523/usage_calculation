class Brand < ApplicationRecord
  belongs_to :campany
  has_many :shops, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  
end
