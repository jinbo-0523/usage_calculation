class BrandsController < ApplicationController
  before_action :set_brand, only: %i[edit update destroy]
  before_action :get_brands, only: %i[new create edit update destroy]

  def index
    redirect_to new_brand_path
  end  
  def new
    @brand = current_company.brands.new
    @q = current_company.brands.ransack(params[:q])
    @search_brand = @q.result.order(id: :asc).page(params[:page]).per(20)
  end
  
  def create
    @brand = current_company.brands.new(brand_params)
    if @brand.save
      redirect_to new_brand_path, notice: "新しく業態を作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @q = current_company.brands.ransack(params[:q])
      @search_brand = @q.result.order(id: :asc).page(params[:page]).per(20)
      render :new
    end
  end

  def show
    redirect_to edit_brand_path
  end
  
  def edit
    @q = current_company.brands.ransack(params[:q])
    @search_brand = @q.result.order(id: :asc).page(params[:page]).per(20)
  end
  
  def update
    if @brand.update(brand_params)
      redirect_to new_brand_path, notice:"業態を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @q = current_company.brands.ransack(params[:q])
      @search_brand = @q.result.order(id: :asc).page(params[:page]).per(20)
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
