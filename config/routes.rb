Rails.application.routes.draw do
  resources :questions, only: [:index]
  resources :dashboards, only: [:index]
  resources :agile_teams, only: [:show]
  resources :score_cards

  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get 'pages/welcome'
  get 'agile_teams/:id/health_progression', to: 'agile_teams#health_progression', as: 'health_progression'

  
  root to: 'pages#welcome'
end
