class ListsController < ApplicationController
  before_action :set_list, only: [ :show, :edit, :update, :destroy ]

  def index
    @lists = current_user.boards.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.boards.lists.new(sword_params)

    if @list.save
    flash[:success] = "List Created"
      redirect_to lists_path
    else
      flash[:error] = "error #{@sword.errors.full_messages.join('\n')}"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
   if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = current_user.boards.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
