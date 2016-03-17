Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'
  get '/login', to: 'sessions#show_login_form'
  post '/login', to: 'sessions#do_login'
  get 'logout', to: 'sessions#destroy'

  resources :users
end
