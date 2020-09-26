class ShopsController < ApplicationController
  before_action :set_shop, only: %i[edit update destroy]
  def index
    @shops = current_company.shops.order(id: :asc)
  end

  def new
    @shop = current_company.shops.new
    @brands = current_company.brands.order(id: :asc)
  end

  def create
    # 他の会社の brand_id になっている場合は例外を出す
    current_company.brands.find(params[:shop][:brand_id])
    @shop = User.new(shop_params)
    if @shop.save
      redirect_to shops_path, notice: "新しくユーザーを作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @brands = current_company.brands.order(id: :asc)
      render :new
    end
  end

  def show
  end

  def edit
    @brands = current_company.brands.order(id: :asc)

  end

  def update
    if @shop.update(shop_params)
      redirect_to shops_path, notice:"職位を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @brands = current_company.brands.order(id: :asc)
      render :edit
    end
  end

  def destroy
    @shop.destroy!
    redirect_to shops_path, alert: "削除しました"
  end

  def set_shop
    @shop = current_company.shops.find(params[:id])
  end

  private
  def shop_params
    params.require(:shop).permit(:employee_id, :brand_id, :name, :display)
  end
end

