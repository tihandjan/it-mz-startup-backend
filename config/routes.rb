Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api, default: {format: :json} do 
    namespace :v1 do
      resources :recipes
      mount_devise_token_auth_for 'Admin', at: 'admin/auth'
      mount_devise_token_auth_for 'User', at: 'user/auth'
      resources :ingredients, only: [:index, :create]
      resources :categories, only: [:index, :show]
      resources :countries, only: [:index]
      resources :sub_categories, only: [:index]
    end
  end
end
