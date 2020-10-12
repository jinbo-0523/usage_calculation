class Report < ApplicationRecord
  belongs_to :user
  belongs_to :shop 
  has_many :orders, dependent: :destroy
  has_many :recipes, through: :orders

  accepts_nested_attributes_for :orders, allow_destroy: true
  
  validates :date, presence: true, uniqueness: { scope: :shop_id }
  validates :sale, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
