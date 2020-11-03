class Companies::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]

  def check_guest
    if resource.email == 'test@test'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除できません。'
    end
  end

end
