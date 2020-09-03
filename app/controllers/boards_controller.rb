class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :edit, :destroy]
  
  def index
    @boards = current_user.boards
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create 
    current_user.boards.create(board_params)
    redirect_to boards_path
  end

  def edit
  end

  def update
    current_user.boards.update(board_params)
    redirect_to boards_path
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def set_board
  @board = current_user.boards.find(params[:id])
  end
end