class Shop < ApplicationRecord
  belongs_to :brand
  has_many :reports, dependent: :destroy
  has_one :company, through: :brand
  # has_many :

  validates :name, presence: true, uniqueness: { scope: :brand_id }
  validate :number_uniqueness

  # shopからcompanyは取れないのでカスタム化
  def number_uniqueness
    # カンパニーID（仮にcompany_id:1）が含まれるbrandを取得、.idsで配列化
    brand_ids = Brand.where(company_id: brand.company_id).ids
    # 作ろうとした店舗のnumberに一致するbrand_idをshopに入れる
    shop = Shop.find_by(number: number, brand_id: brand_ids)
    # shopがすでにあった場合、バリデーションに引っかかる
    # if shop.present? && shop  元のコードだとselfも含まれて編集できなかったので != self で除外する
    if shop.present? && shop != self
      errors.add(:base, I18n.t("activerecord.errors.messages.number"))
    end
  end
end
