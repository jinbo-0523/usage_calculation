class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  def index
    @users = current_company.users.order(id: :asc)
  end

  def new
    @user = current_company.users.new
    @ranks = current_company.ranks.order(id: :asc)
  end

  def create
    # 他の会社の rank_id になっている場合は例外を出す
    current_company.ranks.find(params[:user][:rank_id])
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "新しくユーザーを作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @ranks = current_company.ranks.order(id: :asc)
      render :new
    end
  end

  def show
  end

  def edit
    @ranks = current_company.ranks.order(id: :asc)

  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice:"職位を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @ranks = current_company.ranks.order(id: :asc)
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to users_path, alert: "削除しました"
  end

  def set_user
    @user = current_company.users.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:employee_id, :rank_id, :name, :display)
  end
end
