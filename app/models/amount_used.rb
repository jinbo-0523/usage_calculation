class AmountUsed < ApplicationRecord
  belongs_to :recipe
  belongs_to :order
  belongs_to :user
  belongs_to :store
end
