Rails.application.routes.draw do
  devise_for :users

  root to: 'articles#index'

  resources :articles, only: [:show, :new, :create, :index ] do
    resources :comments, only: [ :new, :create ]
  end

  namespace :my do
    resources :articles, only:[:index]
  end

  get '/articles/:id/upvote', to: 'articles#upvote', as: 'upvote'
  get '/articles/:id/visibility', to: 'articles#update_visibility', as: 'visibility'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
