class RanksController < ApplicationController

  def index
    @ranks = current_company.ranks.order(id: :asc)
  end

  def new
    @rank = Rank.new
  end

  def create
    @rank = Rank.new(rank_params)
    if @rank.save
      reidirect_to ranks_path,noteci:"新しく職位を作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
    @rank.find(params[:id])

  end

  def update
    @rank.find(params[:id])
    if @rank.save
      reidirect_to @rank,noteci:"職位を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      render :new
    end
  end

  def destory
    @rank.find(params[:id])

  end

  private
  def rank_params
    paramas.require(:rank).permit[:name, :display]
    
  end
end
