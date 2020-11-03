class Company < ApplicationRecord
  has_many :brands, dependent: :destroy
  has_many :ranks, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :users, through: :ranks
  has_many :shops, through: :brands
  has_many :recipes, through: :brands
  
  # Include default devise modules. Others_ available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  def self.guest
    find_or_create_by!( email: 'test@test') do |company|
      company.password = SecureRandom.urlsafe_base64
      company.name = "ゲストユーザー"
    end
  end
  
end
