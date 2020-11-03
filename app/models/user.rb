class User < ApplicationRecord
  belongs_to :rank
  has_many :reports
  validates :name, presence: true
  validate :employee_id_uniqueness, if: -> { employee_id.present? }
  validates :display, inclusion: { in: [true, false] }

# userからcompanyは取れないのでカスタム化
  def employee_id_uniqueness
    # カンパニーIDが含まれるrankを取得、.idsで配列化
    rank_ids = Rank.where(company_id: rank.company_id).ids
    # 作ろうとしたuserのemployee_idに一致するrank_idをuserに入れる
    user = User.find_by(employee_id: employee_id, rank_id: rank_ids)
    # userがすでにあった場合、バリデーションに引っかかる
    # if user.present? && user != self で除外して編集できるようにする
    if user.present? && user != self
      errors.add(:base, I18n.t("activerecord.errors.messages.employee_id"))
    end
  end
end
