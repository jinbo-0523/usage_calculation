class User < ApplicationRecord
  has_many :ranks , dependent: :destroy
  belongs_to :amount_userd
                # ↑あってる？
  validates :name, presence: true
  validates :enployee_number, presence: true, uniqueness: true
end
