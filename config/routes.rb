Rails.application.routes.draw do
  resources :books, only: [:index, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user_books, only: [:index, :create]
  
end
