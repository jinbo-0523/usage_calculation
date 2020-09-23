class Company < ApplicationRecord
  has_many :brands, dependent: :destroy
  has_many :ranks, dependent: :destroy
  has_many :foods, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
end
