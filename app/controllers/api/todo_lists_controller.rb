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
      render json: {
          "status": 200,
          "message": "Successfully created",
          "todo_list": @todo_list
      }.to_json
    else
      render json: {
          "status": 500,
          "errors": @todo_list.errors
      }.to_json
    end
  end

  def update
    @todo_list = TodoList.find(params[:id])
    if @todo_list.update(list_params)
      render json: {
        "status": 200,
        "message": "Successfully updated"
      }
    else
      render json: {
        "status": 500,
        "errors": @todo_list.errors
      }.to_json
    end
  end
  def destroy
    @todo_list = TodoList.find(params[:id])
    if @todo_list.destroy
      render json: {
          "status": 200,
          "message": "Successfully deleted",
          "todo_list": @todo_list
      }.to_json
    end
  end

  private
  def list_params
    params.require(:todo_list).permit(:title, :content)
  end
end
