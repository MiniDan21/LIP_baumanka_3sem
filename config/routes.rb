Rails.application.routes.draw do
  resources :users
  root 'homepage#index'
  get 'homepage/index'
  get 'log/sign_in'
  get 'log/sign_out'
  post 'log/log'
  get 'log/log'
  get 'users/new'
  get 'root/input'
  get 'root/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
