class FoodsController < ApplicationController
  def index
    @foods = current_company.foods.order(id: :asc)
  end

  def new
    @food = current_company.foods.new
  end
  
  def create
    @food = current_company.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: "食材を作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def food_params
    params.require(:food).permit(:id, :name, :total, :unit ,:display)
  end
end
