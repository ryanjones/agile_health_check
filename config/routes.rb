Rails.application.routes.draw do
  get 'score_cards/create'

  get 'score_cards/new'

  get 'agile_teams/show'

  get 'dashboards/index'

  devise_for :users
  get 'pages/welcome'
  get 'dashboard', to: 'dashboards#index'
  resources :agile_teams, only: [:show]
  resources :score_cards, only: [:show, :create]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#welcome'
end
