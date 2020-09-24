class RanksController < ApplicationController
  before_action :set_rank, only: %i[edit update destroy]
  def index
    @ranks = current_company.ranks.order(id: :asc)
  end

  def new
    @rank = current_company.ranks.new
  end

  def create
    @rank = current_company.ranks.new(rank_params)
    if @rank.save
      redirect_to ranks_path,noteci:"新しく職位を作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @rank.update(rank_params)
      redirect_to ranks_path, notice:"職位を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @rank.destroy!
    redirect_to ranks_path, alert: "削除しました"
  end

  def set_rank
    @rank = current_company.ranks.find(params[:id])
  end

  private
  def rank_params
    params.require(:rank).permit(:name, :display)
    
  end
end