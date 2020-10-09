class ReportsController < ApplicationController
  def index
    # ここは多分いらない
  end

  def new
# ブランド検索
    @recipes = current_company.recipes.where(display: true).order(id: :asc)
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @q = current_company.brands.ransack(params[:q])
    @search_brands = @q.result
    @brand_shops = Shop.where(brand_id: @search_brands.ids).order(id: :asc)
    @brand_recipes = Recipe.where(brand_id: @search_brands.ids).order(id: :asc)
# ブランド結果からのレシピ
# ブランド検索からの店舗
# ①直打ちルートで必要な情報は？
  # 全ユーザー
    @users = current_company.users.where(display: true).order(id: :asc)
    # 全ブランド
    @brands = current_company.brands.where(display: true).order(id: :asc)
    #   とその中のレシピ（→ブランド選択して「表示」を押すとレシピが表示されるような感じ）
    #   とその中の全ショップ
    # @shops = current_company.shops.order(id: :asc)
# ②店舗詳細ルートで必要な情報は？
    # shopの定義。shop_idをパラメーターで送る。そこにはbrandも入ってる。
    # 店舗の属している業態のレシピ
    # @shop = current_company.shops.find(@shops[:id])
    # @recipes = current_company.recipes.where(display: true).order(id: :asc)
    
    # @report = @shops.reports.new
    # .includes(:user)の使いどころは？
    # @report.orはいders.build
  end
  
  def create
    @report = current_company.shops.reports.new(report_params)
    if @report.save
      redirect_to shop_path, notice:"出数入力が完了しました"
    else
      # newで必要な@値を複数入れる
      # @
      # @
      # @
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end

  def show
    # 多分不要
  end

  def edit
    @users
    @brands
    @recipes
  end

  def update
  end

  def destroy
  end
  private
  def report_params
    params.require(:report).permit(:date, :sale, :user_id, orders_attributes:[:id, :count, :recipe_id, :report_id])
  end
end
