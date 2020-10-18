class ReportsController < ApplicationController
  def index
    redirect_to new_report_path
  end

  def new
    @users = current_company.users.where(display: true).order(id: :asc)
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @recipes = current_company.recipes.where(display: true).order(id: :asc)
    @q = current_company.brands.ransack(params[:q])
    @search_brands = @q.result
    @brand_shops = Shop.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
    @brand_recipes = Recipe.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
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
      @brand_shops = Shop.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
      @brand_recipes = Recipe.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end

  def show
    redirect_to edit_report_path
  end

  def edit
    @users = current_company.users.where(display: true).order(id: :asc)
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @recipes = current_company.recipes.where(display: true).order(id: :asc)
    # @search_brands = current_company.brands.ransack(params[:id]).result
    @report = Report.find(params[:id])
    q = { id_eq: @report.shop.brand.id }
    @search_brands = current_company.brands.ransack(q).result
    @brand_shops = Shop.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
    @brand_recipes = Recipe.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
  end

  def update
    @report = Report.find(params[:id])
    
    if @report.update(report_params)
      redirect_to @report.shop, notice:"出数編集が完了しました"
    else
      @users = current_company.users.where(display: true).order(id: :asc)
      @brands = current_company.brands.where(display: true).order(id: :asc)
      @recipes = current_company.recipes.where(display: true).order(id: :asc)
      @q = current_company.brands.ransack(params[:q])
      @search_brands = @q.result
      @brand_shops = Shop.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
      @brand_recipes = Recipe.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  private
  def report_params
    params.require(:report).permit(:date, :sale, :user_id, :shop_id, orders_attributes:[:id, :count, :recipe_id, :report_id])
  end
end
