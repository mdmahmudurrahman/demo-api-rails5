Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists do
      resources :todo_list_items
    end
  end

  resources :todo_lists
end
