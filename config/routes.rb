Rails.application.routes.draw do

  resources :entries, only: [:create, :destroy, :show] do
    resources :comments
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  root "demo_pages#home"
  get "help" => "demo_pages#help"
  get "signup" => "users#new"
  get "login" => 'sessions#new'
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

end
