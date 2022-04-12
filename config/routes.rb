# frozen_string_literal: true

Rails.application.routes.draw do
  root 'hunters#welcome'

  resources :hunters, param: :hunter_uuid
  resources :items, param: :item_uuid do
    resources :captures, only: [:create, :index]
  end
  resources :bonus_items, only: [:new, :create]

  ##sessions
  get 'login', to: 'sessions#login'
  get 'register', to: 'sessions#new', as: 'register'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get "/admin", to: "items#new"
  post "/admin", to: "items#create"

  ##easter eggs
  get '/bugs', to: 'items#all'
  get '/lola', to: 'items#all'
  get '/peter', to: 'items#all'
  get '/roger', to: 'items#all'

  get '/clues', to: 'items#clues', as: 'clues'

  get '/wrong', to: 'items#wrong'

	## Scoreboard
	resources :scoreboard, only: :index
  get '/scoreboard', to: 'scoreboard#all', as: 'scoreboard'
end
