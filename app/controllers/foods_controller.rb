class FoodsController < ApplicationController
  def index
    @foods = current_company.foods.order(id: :asc)
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
