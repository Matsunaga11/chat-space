Rails.application.routes.draw do
devise_for :users
resources :users, only: [:edit, :update]
root 'groups#index'
resources :groups do#, only:[:index, :new, :edit, :create, :update] do
   resources :messages, except:[:update]
end
 end




