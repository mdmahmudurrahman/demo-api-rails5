class Api::TodoListItemsController < ApplicationController
  before_action :find_todo_list

  def create
    @todo_list_item = @todo_list.todo_list_items.new(list_params)
    if @todo_list_item.save
      render "status": 200, json: {
        "message": "Successfully created",
        "todo_list_item": @todo_list_item
      }.to_json
    else
      render "status": 402, json: {
        "message": @todo_list_item.errors
      }.to_json
    end
  end

  def update
    @todo_list_item = @todo_list.todo_list_items.find(params[:id])
    if @todo_list_item.update(list_params)
      render "status": 200, json: {
        "message": "Successfully updated",
        "todo_list_item": @todo_list_item
      }.to_json
    else
      render "status": 402, json: {
        "message": @todo_list_item.errors
      }.to_json
    end
  end

  def destroy
    @todo_list_item = @todo_list.todo_list_items.find(params[:id])
    @todo_list_item.destroy
    render "status": 200, json: {
      "message": "Deleted Successfully",
      "todo_list_item": @todo_list_item
    }.to_json
  end

  private
  def list_params
    params.require(:todo_list_item).permit(:title, :content)
  end

  def find_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

end
