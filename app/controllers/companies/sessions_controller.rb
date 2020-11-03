class Companies::SessionsController < Devise::SessionsController
  def new_guest
    company = Company.guest
    sign_in company
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
