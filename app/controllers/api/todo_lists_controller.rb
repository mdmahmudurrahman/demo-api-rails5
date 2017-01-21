class Api::TodoListsController < ApplicationController
  before_action :find_todo_list

  def index
    @todo_lists = TodoList.all
    render json: @todo_lists
  end

  def show
    render json: @todo_list.as_json(include: {todo_list_items: { only: :title}})
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
    if @todo_list.update(list_params)
      render "status": 200, json: {
        "message": "Successfully updated"
      }
    else
      render "status": 422, json: {
        "errors": @todo_list.errors
      }.to_json
    end
  end
  def destroy
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

  def find_todo_list
    @todo_list = TodoList.find(params[:id])
  end
end
