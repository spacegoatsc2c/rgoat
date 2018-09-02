Rails.application.routes.draw do
  get 'welcome/index'

  get '/auth/:provider/callback', to: 'sessions#create'

  root 'welcome#index'
end
