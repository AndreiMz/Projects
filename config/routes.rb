Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
  resources :channels, only: [:edit, :update, :destroy, :create, :new]
  resources :videos, only: [:edit, :update, :destroy, :create, :new]
end
  resources :channels, only: [:index, :show]
  resources :videos, only: [:index, :show]
  get 'favorites/new', to:'users#new_favorite', :as => :new_favorite
  post 'favorites', to:'users#create_favorite'
  get 'favorites', to:'users#favorite_page'
  get '/channels/show_iframe/:id' =>'channels#show_iframe', :as => :channels_iframe
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
