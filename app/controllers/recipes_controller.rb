class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[edit udate destroy]
  before_action :get_recipes, only: %i[new create edit udate destroy]
  
  def new
    @recipe = current_company.recipes.new
    @brands = current_company.brands.order(id: :asc)
  end
  
  def create
    current_company.brands.find(params[:recipe][:brand_id])
    @recipe =Recipe.new(recipe_params)
    if @user.save
      redirect_to new_user_path, notice: "新しくレシピを作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @ranks = current_company.ranks.order(id: :asc)
      render :new
    end
  end
  
  def edit
    @recipes = current_company.brands.order(id: :asc)
  end
  
  def update
    if @recipe.update(recipe_params)
      redirect_to new_recipe_path, notice:"レシピを編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @ranks = current_company.ranks.order(id: :asc)
      render :edit
    end
  end
  
  def destroy
    @user.destroy!
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
    params.require(:recipe).permit(:name, :brand_id)
  end
end
