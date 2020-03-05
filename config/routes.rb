Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :matches, only: [:show, :create, :destroy] do
   resources :messages, only: [:create, :destroy]
  end

end
