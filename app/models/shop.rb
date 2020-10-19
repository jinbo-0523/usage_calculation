class Shop < ApplicationRecord
  belongs_to :brand
  has_many :reports, dependent: :destroy
  has_one :company, through: :brand
  # has_many :

  validates :name, presence: true, uniqueness: { scope: :brand_id }
  validate :number_uniqueness

  def number_uniqueness
    brand_ids = Brand.where(company_id: brand.company_id).ids
    # カンパニーID（仮にcompany_id:1）が含まれるbrandを取得、.idsで配列化
    shop = Shop.find_by(number: number, brand_id: brand_ids)
    # 作ろうとした店舗のnumberに一致するbrand_idをshopに入れる
    if shop.present?
      errors.add(:base, I18n.t("activerecord.errors.messages.number"))
      # shopがあった場合、バリデーションに引っかかる
    end
  end
end
