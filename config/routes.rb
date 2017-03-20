Rails.application.routes.draw do
  root 'galls#index'
  # resources :sessions

  # resources :users do
  #   resources :galls do
  #     resources :photos
  #   end
  # end

  resources :users, shallow: true do
    member do

      resources :galls do
        member do

          resources :photos

        end
      end

    end
  end

  # post "/galls/new"  => 'galls#create'
  # post "/users/new" => 'users#create'
  get "/login"     => 'sessions#new', as: :login
  post "/login"    => 'sessions#create'
  delete "/logout" => 'sessions#destroy', as: :logout
  get  "/share/:id"    => 'shares#new', as: :share
  post "/share/:id"    => 'shares#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
