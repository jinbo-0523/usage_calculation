class BrandsController < ApplicationController
  before_action :set_brand, only: %i[edit update destroy]
  before_action :get_brands, only: %i[new create edit update destroy]

  def index
    redirect_to new_brand_path
  end  
  def new
    @brand = current_company.brands.new
  end
  
  def create
    @brand = current_company.brands.new(brand_params)
    if @brand.save
      redirect_to new_brand_path, notice: "新しく業態を作成しました"
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
      redirect_to new_brand_path, notice:"業態を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @brand.destroy!
    redirect_to new_brand_path, alert: "削除しました"
  end
  
  private

  def set_brand
    @brand = current_company.brands.find(params[:id])
  end
  
  def get_brands
    @brands = current_company.brands.order(id: :asc)
  end

  def brand_params
    params.require(:brand).permit(:name, :display)
  end
end
