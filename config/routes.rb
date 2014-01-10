Rails.application.routes.draw do
  root 'sites#index'

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  # front end
  resource :session, only: [:new, :create, :destroy]
  resources :sites do
    member { get :pixel }
    resources :tracking_links
  end
  resources :users, except: [:show]

  namespace :data do
    resources :sites, only: [] do
      member do
        get :visits_and_conversions
      end
    end
  end

  # redirects / tracking
  namespace :track do
    resources :visits
    resources :conversions
  end
  get 'r/:token', to: 'track/visits#new'
end
