Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  get '/users/', to: 'users#index'
  get '/users/:id/', to: 'users#show'

  get '/posts/new', to: 'posts#new'
  get '/users/:user_id/posts/', to: 'posts#index'
  get '/users/:user_id/posts/:id/', to: 'posts#show'

  
  
  post '/posts', to: 'posts#create'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create'
  delete '/users/:user_id/posts/:id', to: 'posts#destroy'
end
