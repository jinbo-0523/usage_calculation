class Company < ApplicationRecord
  has_many :brands, dependent: :destroy
  has_many :ranks, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :users, through: :ranks
  
  # Include default devise modules. Others_ available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
end
