class BrandsController < ApplicationController
  before_action :set_brand, only: %i[edit update destroy]
  def index
    @brands = current_company.brands.order(id: :asc)
  end

  def new
    @brand = current_company.brands.new
  end

  def create
    @brand = current_company.brands.new(brand_params)
    if @brand.save
      redirect_to brands_path, notice: "新しく職位を作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to brands_path, notice:"職位を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @brand.destroy!
    redirect_to brands_path, alert: "削除しました"
  end

  def set_brand
    @brand = current_company.brands.find(params[:id])
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :display)
  end
end
