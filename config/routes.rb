Rails.application.routes.draw do
  require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
  mount Sidekiq::Web => '/sidekiq'
  # end

  get 'feedbacks/new'
  get 'recipes/show'
  get '/chatbot', to: 'chat#handle_message'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/profile", to: "pages#profile"
  get "/get_card", to: "pages#get_card"

  resources :feedbacks, only: [:new, :create]

  resources :recipes, only: [:index, :show]

  resources :places, only: :index

  resources :flavor_profiles, only: [:new, :create, :edit, :update]
  # Defines the root path route ("/")
  # root "articles#index"
end
