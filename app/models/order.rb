class Order < ApplicationRecord
  belongs_to :amount_userd, optional: true
                            # ↑あってる？
  has_many :recipes
  validates: presence: true
end
