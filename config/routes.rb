Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, default: {format: :json} do 
    namespace :v1 do
      mount_devise_token_auth_for 'Admin', at: 'admin/auth'
      mount_devise_token_auth_for 'User', at: 'user/auth'
      resources :recipies
    end
  end
end
