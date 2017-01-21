class Api::TodoListsController < ApplicationController

  def index
    @todo_lists = TodoList.all
    render json: @todo_lists
  end

  def show
    @todo = TodoList.find(params[:id])
    render json: @todo
  end

  def create
    @todo_list = TodoList.new(list_params)
    if @todo_list.save
      head 200
    else
      head 500
    end
  end

  private
  def list_params
    params.require(:todo_list).permit(:title, :content)
  end
end
