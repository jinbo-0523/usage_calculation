class FoodsController < ApplicationController
  before_action :get_foods, only: %i[new create edit update destroy]
  before_action :set_food, only: %i[edit update destroy]
  def index
    redirect_to new_food_path
  end
  def new
    @food = current_company.foods.new
  end
  
  def create
    @food = current_company.foods.new(food_params)
    if @food.save
      redirect_to new_food_path, notice: "食材を作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end
  
  def show
    redirect_to edit_food_path
  end

  def edit
  end
  
  def update
    if @food.update(food_params)
      redirect_to new_food_path, notice:"食材を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @food.destroy!
    redirect_to new_food_path, alert: "削除しました"
  end
  
  private
  
  def set_food
    @food = current_company.foods.find(params[:id])
  end
  
  def get_foods
    @foods = current_company.foods.order(id: :asc)
  end
  
  def food_params
    params.require(:food).permit(:id, :name, :total, :unit ,:display)
  end
end
