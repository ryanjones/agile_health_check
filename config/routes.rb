Rails.application.routes.draw do
  get 'score_cards/create'

  get 'score_cards/new'

  get 'dashboards/index'

  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get 'pages/welcome'
  get 'dashboard', to: 'dashboards#index'
  resources :agile_teams, only: [:show]
  get 'agile_teams/:id/health_progression', to: 'agile_teams#health_progression', as: 'health_progression'

  resources :score_cards

  namespace :api, defaults: { format: :json } do
    namespace :stats do
      get 'agile_teams'
    end
  end

  root to: 'pages#welcome'
end
