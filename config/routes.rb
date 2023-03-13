Rails.application.routes.draw do
  get 'feedbacks/new'
  get 'recipes/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/profile", to: "pages#profile"

  resources :feedbacks, only: [:new, :create]

  resources :recipes, only: [:index, :show]

  resources :places, only: :index

  resources :flavor_profiles, only: [:new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
end
