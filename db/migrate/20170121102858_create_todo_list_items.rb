class CreateTodoListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_list_items do |t|
      t.string :title
      t.text :content
      t.references :todo_list, foreign_key: true

      t.timestamps
    end
  end
end
