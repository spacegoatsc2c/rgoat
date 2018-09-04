Rails.application.routes.draw do
  get 'welcome/index'

  resources :youtube

  get '/auth/:provider/callback', to: 'sessions#create', as: :login
  get '/change_character/:character_id', to: 'sessions#pick', as: :pick
  get '/logout', to: 'sessions#logout', as: :logout

  root 'welcome#index'
end
