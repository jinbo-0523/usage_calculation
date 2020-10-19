class ShopsController < ApplicationController
  before_action :get_shops, only: %i[new create edit update destroy]
  before_action :set_shop,  only: %i[edit update destroy]
  
  def index
    redirect_to new_shop_path
  end
  def new
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @q = current_company.shops.ransack(params[:q])
    @search_shop = @q.result.order(id: :asc).page(params[:page]).per(30)
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
      @brands = current_company.brands.where(display: true).order(id: :asc)
      @q = current_company.shops.ransack(params[:q])
      @search_shop = @q.result.order(id: :asc).page(params[:page]).per(30)
      render :new
    end
  end
  
  def show
    # 詳細表示しようとしたshopのID
    @shop = current_company.shops.find(params[:id])
    # そこのreportとrecipeを以下で取ってきている
    @reports = @shop.reports.order(date: :desc).page(params[:page]).per(7)
    @recipes = @shop.brand.recipes.where(display: true).order(:id)
    @foods = Food.where(id: @shop.brand.display_food_ids).order(id: :asc)
    @food_list = @reports.list_of_food_recipes.map do |food_recipe|
      amounts = @foods.map do |food|
        index = food_recipe[:recipe_ids].index(food.id)
        amount = index.nil? ? 0 : food_recipe[:amounts][index].fdiv(food.total).round(1)
        "#{amount}#{food.unit}"
      end
      {
        date: food_recipe[:date],
        amounts: amounts
      }
    end
  end

  def edit
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @q = current_company.shops.ransack(params[:q])
    @search_shop = @q.result.order(id: :asc).page(params[:page]).per(30)
    
  end
  def update
    if @shop.update(shop_params)
      redirect_to new_shop_path, notice:"店舗を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @brands = current_company.brands.where(display: true).order(id: :asc)
      @q = current_company.shops.ransack(params[:q])
      @search_shop = @q.result.order(id: :asc).page(params[:page]).per(30)
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
