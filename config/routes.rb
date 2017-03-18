Rails.application.routes.draw do
  root 'users#marketing'
  # resources :sessions

  resources :users do
    resources :galls do
      resources :photos
    end
  end

  # post "/galls/new"  => 'galls#create'
  post "/users/new" => 'users#create'
  get "/login" => 'sessions#new', as: :login
  post "/login" => 'sessions#create'
  delete "/logout" => 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
