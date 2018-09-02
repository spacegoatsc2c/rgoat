Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  get '/auth/:provider/callback', to: 'sessions#create'

  root 'welcome#index'
end
