class ReportsController < ApplicationController
  def index
    # ここは多分いらない
  end

  def new
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @shops = current_company.shops.order(id: :asc)
    @recipes = current_company.recipes.where(display: true).order(id: :asc)
    @users = current_company.users.where(display: true).order(id: :asc)
    # @report = current_company.shops.reports.new
    # .includes(:user)の使いどころは？
  end
  
  def create
    @report = current_company.shops.reports.new(report_params)
    if @report.save
      redirect_to shop_path, notice:"出数入力が完了しました"
    else
      # newで必要な@値を複数入れる
      # @
      # @
      # @
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end

  def show
    # 多分不要
  end

  def edit
    @users
    @brands
    @recipes
  end

  def update
  end

  def destroy
  end
  private
  def report_params
    params.require(:report).permit(:date, :sale, :user_id, orders_attributes:[:id, :count, :recipe_id, :report_id])
  end
end
