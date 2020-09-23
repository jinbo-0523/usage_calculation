class User < ApplicationRecord
  belongs_to :rank
  has_many :reports
  validates :name, presence: true
  validates :employee_id, uniqueness: true, if: -> { employee_id.present? }
  validates :display, inclusion: { in: [true, false] }
end
