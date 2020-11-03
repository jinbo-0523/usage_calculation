class CompaniesController < ApplicationController
  skip_before_action :authenticate_company!, only: :index
  
  def index
    if company_signed_in?
      @brands = current_company.brands.where(display: true).order(id: :asc)
      @shops = current_company.shops.where(display: true).order(id: :asc)
      @q = current_company.shops.ransack(params[:q])
      @search_shop = @q.result.includes([:brand]).where(display: true).order(id: :asc).page(params[:page]).per(20)
      #↑↑↑bulletのアラートがここを指摘。includesはransackの公式でここが多いのでここに。
      
    else
      redirect_to  new_company_session_path
    end
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
