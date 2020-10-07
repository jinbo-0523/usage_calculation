class ShopsController < ApplicationController
  before_action :get_shops, only: %i[new create edit update destroy]
  before_action :set_shop,  only: %i[edit update destroy]
  
  def new
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @q = current_company.shops.ransack(params[:q])
    @search_shop = @q.result
    @shop = current_company.shops.new
  end
  
  def create
    # 他の会社の brand_id になっている場合は例外を出す
    current_company.brands.find(params[:shop][:brand_id])
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to new_shop_path, notice: "新しく店舗を作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @q = current_company.shops.ransack(params[:q])
      @search_shop = @q.result
      @brands = current_company.brands.where(display: true).order(id: :asc)
      render :new
    end
  end
  
  def show
    @shop = current_company.shops.find(params[:id])
    # ＃showに必要なもの
    #   値は？     →@report
    @reports = @shop.reports.order(id: :asc)
    #             →@order
    # @orders = current_company.orders.order(id: :asc)
    #             →@user
    @users = current_company.users.order(id: :asc)
    @foods = current_company.foods.order(id: :asc)
    @recipes = current_company.recipes.order(id: :asc)

  end
  
  def edit
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @q = current_company.shops.ransack(params[:q])
    @search_shop = @q.result
    
  end
  
  def update
    if @shop.update(shop_params)
      redirect_to new_shop_path, notice:"店舗を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @brands = current_company.brands.where(display: true).order(id: :asc)
      render :edit
    end
  end
  
  def destroy
    @shop.destroy!
    redirect_to new_shop_path, alert: "削除しました"
  end
  
  private

  def set_shop
    @shop = current_company.shops.find(params[:id])
  end
  
  def get_shops
    @shops = current_company.shops.order(id: :asc)
  end

  def shop_params
    params.require(:shop).permit(:number, :brand_id, :name, :display)
  end
end
