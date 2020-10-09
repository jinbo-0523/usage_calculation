class Report < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :orders 
  
  validates :date, presence: true, uniqueness: { scope: :shop_id }
  validates :sale, presence: true, numericality: { only_integer: true, greater_than: 0 }
  accepts_nested_attributes_for :order, allow_destroy: true
end
