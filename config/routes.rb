Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, default: {format: :json} do 
    mount_devise_token_auth_for 'Admin', at: 'admin/auth'

    mount_devise_token_auth_for 'User', at: 'user/auth'
   # as :user do
      # Define routes for User within this block.
    #end
  end
end
