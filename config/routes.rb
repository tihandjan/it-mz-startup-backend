Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount_devise_token_auth_for 'User', at: 'auth'
  # mount_devise_token_auth_for 'Admin', at: 'admin/auth'

  
  namespace :api, default: {format: :json} do 
    namespace :v1 do
      resources :recipes do
        resources :comments, only: [:create, :index, :destroy]
        resources :votes, only: [:create]
      end
      resources :ingredients, only: [:index, :create]
      resources :categories, only: [:index, :show]
      resources :countries, only: [:index]
      resources :sub_categories, only: [:index]
      resources :comments, only: [:destroy] do
        resources :comments, only: [:create]
        resources :votes, only: [:create]
      end
    end
  end
end
