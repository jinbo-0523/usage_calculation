class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[edit update destroy]
  before_action :get_recipes, only: %i[new create edit update destroy]
  

  def index
    
  end

  def new
    # indexで@recipesが必要
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @q = current_company.recipes.ransack(params[:q])
    @search_recipe = @q.result.order(id: :asc)
    
    @foods = current_company.foods.order(id: :asc)
    @recipe = current_company.recipes.new
    @recipe.food_recipes.build
  end
  
  def create
    # brand_id が自分の会社のものかチェック
    @brand = current_company.brands.find(recipe_params[:brand_id])
    # 自分の会社の食材かチェック
    request_food_ids = recipe_params[:food_recipes_attributes].values.map { |param| param[:food_id].to_i }
    raise ActiveRecord::RecordNotFound unless (request_food_ids - current_company.foods.ids).empty?

    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to new_recipe_path, notice: "新しくレシピを作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @brands = current_company.brands.where(display: true).order(id: :asc)
      @q = current_company.recipes.ransack(params[:q])
      @search_recipe = @q.result.order(id: :asc)  
      @foods = current_company.foods.order(id: :asc)
      render :new
    end
  end
  
  def edit
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @foods = current_company.foods.order(id: :asc)
    @q = current_company.recipes.ransack(params[:q])
    @search_recipe = @q.result.order(id: :asc)
  end
  
  def update
    if @recipe.update(recipe_params)
      redirect_to new_recipe_path, notice:"レシピを編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @brands = current_company.brands.where(display: true).order(id: :asc)
      render :edit
    end
  end
  
  def destroy
    @recipe.destroy!
    redirect_to new_recipe_path, alert: "削除しました"
  end

  private
  
  def set_recipe
    @recipe = current_company.recipes.find(params[:id])
  end
  
  def get_recipes
    @recipes = current_company.recipes.order(id: :asc)
  end
  
  def recipe_params
    params.require(:recipe).permit(:name, :brand_id,  :display, food_recipes_attributes: [:id, :recipe_id, :food_id, :amount, :_destroy])
  end
end
