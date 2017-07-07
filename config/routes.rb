Rails.application.routes.draw do
  get 'score_cards/create'

  get 'score_cards/new'

  get 'agile_teams/show'

  get 'dashboards/index'

  devise_for :users
  get 'pages/welcome'
  get 'dashboard', to: 'dashboards#index'
  resources :agile_teams, only: [:show]
  resources :score_cards
  
  root to: 'pages#welcome'
end
