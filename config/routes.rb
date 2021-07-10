Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles, only: [:show, :new, :create ] do
    resources :comments, only: :create
  end

  get '/articles/:id/upvote', to: 'articles#upvote', as: 'upvote'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
