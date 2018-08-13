Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :beers
    resources :beer_styles
    resources :breweries

    root to: "beers#index"
  end

  get 'welcome/index'

  resources :beer_styles, :beers, :breweries

  root 'welcome#index'
  
  get "welcome/autocomplete" => "welcome#autocomplete"
  
  get "autocomplete" => "welcome#autocomplete"
end
