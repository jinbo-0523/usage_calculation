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
    # @search_brandsと同じbrand_idを持ってる店舗とレシピを以下二つで取得する
    @brand_shops = Shop.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
    @brand_recipes = Recipe.where(brand_id: @search_brands.ids).where(display: true).order(id: :asc)
    @report = Report.new
    # レシピをそれぞれ取り出し、
    @brand_recipes.each do |recipe|
      # recipeの数だけbuildしていく。上でdisplay: trueを使っているので非表示設定のものは弾かれる
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
    # 送られてきた@reportの中のrecipe_idを先に取り出す
    order_recipe_ids = @report.orders.pluck(:recipe_id)
    @orders = []
    @brand_recipes.each do |recipe|
      # .include?( )で配列の中に引数のものが入っていればtrueの処理
      if order_recipe_ids.include?(recipe.id)
        @orders << @report.orders.find_by(recipe_id: recipe.id)
        # order_recipe_idsと同じidが含まれていたら、取り出し
      else
        @orders << @report.orders.build(recipe_id: recipe.id)
        # なければbuildして新しく作る(buildする)
      end
    end
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
    params[:report][:orders_attributes].each do |param|
      param.last[:_destroy] = 1 if param.last[:count] == "0"
    end
    params.require(:report).permit(:date, :sale, :user_id, :shop_id, orders_attributes:[:id, :count, :recipe_id, :report_id, :_destroy])
  end
end
