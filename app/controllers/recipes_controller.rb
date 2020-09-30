class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[edit update destroy]
  before_action :get_recipes, only: %i[new create edit update destroy]
  

  def index
    redirect_to new_recipe_path
    
  end
  def new
    @brands = current_company.brands.order(id: :asc)
    @foods = current_company.foods.order(id: :asc)
    @recipe = current_company.recipes.new
    @recipe.food_recipes.build
    @recipe.food_recipes.build
    @recipe.food_recipes.build
  end
  
  def create
    @foods = current_company.foods.order(id: :asc)
    @brands = current_company.brands.order(id: :asc)
    @food = current_company.foods.find(params[:recipe][:brand_id])
    
    @brand = current_company.brands.find(params[:recipe][:brand_id])
    @recipe =Recipe.new(recipe_params)
    if @recipe.save
      redirect_to new_recipe_path, notice: "新しくレシピを作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @brands = current_company.brands.order(id: :asc)
      @foods = current_company.foods.order(id: :asc)
      render :new
    end
  end
  
  def edit
    @brands = current_company.brands.order(id: :asc)
    @foods = current_company.foods.order(id: :asc)
  end
  
  def update
    binding.pry
    if @recipe.update(recipe_params)
      redirect_to new_recipe_path, notice:"レシピを編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @brands = current_company.brands.order(id: :asc)
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
    params.require(:recipe).permit(:name, :brand_id,  :display, food_recipes_attributes: [:id, :recipe_id, :food_id, :amount])
  end
end

