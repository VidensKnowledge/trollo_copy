class BoardsController < ApplicationController
  # before_action :set_board, only: [show, edit, update, destroy] 
  def index
    @boards = Board.all
  end

  def new
    @boards = Board.new
  end

  def create
    @boards = Board.new(board_params)
    if @boards.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
    @boards = Board.find(params[:id])
  end

  def edit
    @boards = Board.find(params[:id])
  end

  def update
  @boards = Board.find(params[:id])
  end

  def destroy
    @boards = Board.find(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(name)
  end

  def set_board
    @boards = Board.find(params[:id])
  end
end
