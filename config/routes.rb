Rails.application.routes.draw do
  get 'dashboards/index'

  devise_for :users
  get 'pages/welcome'
  get 'dashboard', to: 'dashboards#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#welcome'
end
