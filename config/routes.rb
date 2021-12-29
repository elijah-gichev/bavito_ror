Rails.application.routes.draw do

  #login
  post '/auth', to: 'auth#create'
  #registration
  post '/users', to: 'users#create'

  # goods stuff
  post '/goods', to: 'goods#create'
  get '/goods', to: 'goods#index'
  get '/goods/:id', to: 'goods#show'



  #requests
  post '/users/:userId/requests', to: 'requests#create'
  get '/users/:userId/requests', to: 'requests#index'
  get 'users/:userId/requests/:requestId', to: 'requests#index'

  put 'users/:userId/requests/:requestId', to: 'requests#change'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
