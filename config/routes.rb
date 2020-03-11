Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit]
  get 'my_profile', to: 'users#my_profile'
  get "all_users", to: "users#index"
  put "edit_my_user", to: "users#update"

  resources :interactions, only: [:new, :create]

  resources :astrology_charts, only: [:new, :create, :edit, :update]


  resources :matches, only: [:show, :create, :destroy, :index] do
   resources :messages, only: [:create]
  end
  resources :messages, only: [:destroy]


end
