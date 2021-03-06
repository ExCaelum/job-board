Rails.application.routes.draw do

  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  namespace :admin do
    resources :skills
    resources :tags
  end

  resources :users, only: [:create, :new, :edit, :show, :update] do
    resources :skills
  end

  namespace :all do
    resources :skills, only: [:index]
  end

  namespace :guest do
    resources :skills, only: [:index]
  end

  resources :tags, only: [:show, :index]

end
