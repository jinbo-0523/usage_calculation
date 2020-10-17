class CompaniesController < ApplicationController
  
  def index
    @brands = current_company.brands.where(display: true).order(id: :asc)
    @shops = current_company.shops.order(id: :asc)
    @q = current_company.shops.ransack(params[:q])
    @search_shop = @q.result.order(id: :asc).page(params[:page]).per(20)
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
