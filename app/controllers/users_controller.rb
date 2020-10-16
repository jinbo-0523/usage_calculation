class UsersController < ApplicationController
  before_action :set_user,  only: %i[edit update destroy]
  before_action :get_users, only: %i[new create edit update destroy]
  
  def index
    redirect_to new_user_path
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
      redirect_to new_user_path, notice: "新しくユーザーを作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @ranks = current_company.ranks.order(id: :asc)
      render :new
    end
  end

  def show
    redirect_to edit_user_path
  end

  def edit
    @ranks = current_company.ranks.order(id: :asc)
    
  end
  
  def update
    if @user.update(user_params)
      redirect_to new_user_path, notice:"職位を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @ranks = current_company.ranks.order(id: :asc)
      render :edit
    end
  end
  
  def destroy
    @user.destroy!
    redirect_to new_user_path, alert: "削除しました"
  end
  
  private
  
  def set_user
    @user = current_company.users.find(params[:id])
  end
  
  def get_users
    @users = current_company.users.order(id: :asc).page(params[:page]).per(10)
  end
  
  def user_params
    params.require(:user).permit(:employee_id, :rank_id, :name, :display)
  end
end
