class TodoList < ApplicationRecord
  has_many :todo_list_items

  validates_presence_of :title
end
