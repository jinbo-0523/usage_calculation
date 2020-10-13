class ReportsController < ApplicationController
  def index
    # ここは多分いらない
  end

  def new
# 全ユーザー
      @users = current_company.users.where(display: true).order(id: :asc)
# 全ブランド
      @brands = current_company.brands.where(display: true).order(id: :asc)
  # ①直打ちルートで必要な情報は？
      # ブランド検索
        @recipes = current_company.recipes.where(display: true).order(id: :asc)
        @brands = current_company.brands.where(display: true).order(id: :asc)
        @q = current_company.brands.ransack(params[:q])
        @search_brands = @q.result
      # ブランド検索からの店舗
        @brand_shops = Shop.where(brand_id: @search_brands.ids).order(id: :asc)
      # ブランド検索からのレシピ
        @brand_recipes = Recipe.where(brand_id: @search_brands.ids).order(id: :asc)
  # ②店舗詳細ルートで必要な情報は？
    # shopの定義。shop_idをパラメーターで送る。そこにはbrandも入ってる。
    # 店舗の属している業態のレシピ
    # @shop = current_company.shops.find(@shops[:id])
    # @recipes = current_company.recipes.where(display: true).order(id: :asc)
    @report = Report.new
    @brand_recipes.each do |recipe|
      @report.orders.build(recipe_id: recipe.id, recipe_name: recipe.name)
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
      @brands = current_company.brands.where(display: true).order(id: :asc)
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
    @brands = current_company.brands.where(display: true).order(id: :asc)
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
      @brands = current_company.brands.where(display: true).order(id: :asc)
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
