# frozen_string_literal: true

# settings for different routes used in app
Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks',
    profiles: 'users/profiles'
  }

  authenticate :user do
    resources :channels, only: %i[edit update destroy create new]
    resources :videos, only: %i[edit update destroy create new]
  end

  resources :channels, only: %i[index show]
  resources :videos, only: %i[index show]
  resources :videos do
    get :autocomplete_video_title, on: :collection, as: :ac_vid
  end


  scope '/fav', controllers: '' do
    get '', to: 'favorites#list', as: :favlist
    get '/:uid', to:'favorites#view', as: :u_fav
  end

  scope '/:username',controllers: '' do
    get '', to: 'users/profiles#show', as: :profile
    get '/favorites/edit', to: 'favorites#edit_all', as: :edit_my_favorites
    resources :favorites
  end


  get '/channels/show_iframe/:id', to: 'channels#show_iframe',
                                   as: :channels_iframe

  root to: 'home#index'
  get '*path', to: redirect('/'), message: 'Invalid url or unauthorized'
end
    