class ReportsController < ApplicationController
  def index
    # ここは多分いらない
  end

  def new
    @users = current_company.users.where(display: true).order(id: :asc)
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @recipes = current_company.recipes.where(display: true).order(id: :asc)
    @q = current_company.brands.ransack(params[:q])
    @search_brands = @q.result
    @brand_shops = Shop.where(brand_id: @search_brands.ids).order(id: :asc)
    @brand_recipes = Recipe.where(brand_id: @search_brands.ids).order(id: :asc)
    @report = Report.new
    @brand_recipes.each do |recipe|
      @report.orders.build(recipe_id: recipe.id)
    end
  end
  
  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to @report.shop, notice:"出数入力が完了しました"
    else
      @users = current_company.users.where(display: true).order(id: :asc)
      @brands = current_company.brands.where(display: true).order(id: :asc)
      @recipes = current_company.recipes.where(display: true).order(id: :asc)
      @q = current_company.brands.ransack(params[:q])
      @search_brands = @q.result
      @brand_shops = Shop.where(brand_id: @search_brands.ids).order(id: :asc)
      @brand_recipes = Recipe.where(brand_id: @search_brands.ids).order(id: :asc)
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end

  def show
    # 多分不要
  end

  def edit
    @users = current_company.users.where(display: true).order(id: :asc)
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @recipes = current_company.recipes.where(display: true).order(id: :asc)
    @q = current_company.brands.ransack(params[:q])
    @search_brands = @q.result
    @brand_shops = Shop.where(brand_id: @search_brands.ids).order(id: :asc)
    @brand_recipes = Recipe.where(brand_id: @search_brands.ids).order(id: :asc)
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    
    if @report.update(report_params)
      redirect_to @report.shop, notice:"出数入力が完了しました"
    else
      @users = current_company.users.where(display: true).order(id: :asc)
      @brands = current_company.brands.where(display: true).order(id: :asc)
      @recipes = current_company.recipes.where(display: true).order(id: :asc)
      @q = current_company.brands.ransack(params[:q])
      @search_brands = @q.result
      @brand_shops = Shop.where(brand_id: @search_brands.ids).order(id: :asc)
      @brand_recipes = Recipe.where(brand_id: @search_brands.ids).order(id: :asc)
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
  end
  private
  def report_params
    params.require(:report).permit(:date, :sale, :user_id, :shop_id, orders_attributes:[:id, :count, :recipe_id, :report_id])
  end
end
