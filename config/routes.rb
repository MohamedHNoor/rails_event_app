Rails.application.routes.draw do
  resources :events do 
    resources :registrations
    resources :likes
  end

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
  
  resources :categories

  resources :users
  get "signup" => "users#new"

  get "filter/:filter" => "events#index", as: :filtered_events

  root "events#index"
  
end
