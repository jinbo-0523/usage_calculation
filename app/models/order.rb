class Order < ApplicationRecord
  belongs_to :recipe
  validates: presence: true
end
