Rails.application.routes.draw do
  get 'score_cards/create'

  get 'score_cards/new'

  get 'agile_teams/show'

  get 'dashboards/index'

  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get 'pages/welcome'
  get 'dashboard', to: 'dashboards#index'
  resources :agile_teams, only: [:show]
  resources :score_cards
  
  root to: 'pages#welcome'
end
