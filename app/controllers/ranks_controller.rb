class RanksController < ApplicationController
  before_action :set_rank, only: %i[edit update destroy]
  before_action :get_ranks, only: %i[new create edit update destroy]
  def index
    redirect_to new_rank_path
  end
  
  def new
    @rank = current_company.ranks.new
    @q = current_company.ranks.ransack(params[:q])
    @search_rank = @q.result.order(id: :asc).page(params[:page]).per(10)
    
  end
  
  def create
    @rank = current_company.ranks.new(rank_params)
    if @rank.save
      redirect_to new_rank_path, notice: "新しく職位を作成しました"
    else
      flash.now[:alert] = "作成に失敗しました"
      @q = current_company.ranks.ransack(params[:q])
      @search_rank = @q.result.order(id: :asc).page(params[:page]).per(10)
      render :new
    end
  end
  
  def show
    redirect_to edit_rank_path
  end

  def edit
    @q = current_company.ranks.ransack(params[:q])
    @search_rank = @q.result.order(id: :asc).page(params[:page]).per(10)
  end
  
  def update
    if @rank.update(rank_params)
      redirect_to new_rank_path, notice:"職位を編集しました"
    else
      flash.now[:alert] = "編集に失敗しました"
      @q = current_company.ranks.ransack(params[:q])
      @search_rank = @q.result.order(id: :asc).page(params[:page]).per(10)
      render :edit
    end
  end
  
  private
  
  def set_rank
    @rank = current_company.ranks.find(params[:id])
  end
  
  def get_ranks
    @ranks = current_company.ranks.order(id: :asc).page(params[:page]).per(10)
  end
  
  def rank_params
    params.require(:rank).permit(:name, :display)
  end
end
