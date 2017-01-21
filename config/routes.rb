Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists
  end

  resources :todo_lists
end
