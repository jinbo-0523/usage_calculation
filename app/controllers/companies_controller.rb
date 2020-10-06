class CompaniesController < ApplicationController
  
  def index
    @company = current_company
    @shops = current_company.shops.order(id: :asc)
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
