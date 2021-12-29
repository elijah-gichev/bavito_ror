Rails.application.routes.draw do

  #login
  post '/auth', to: 'auth#create'
  #registration
  post '/users', to: 'users#create'

  # goods stuff
  post '/goods', to: 'products#create'
  get '/goods', to: 'products#index'
  get '/goods/:id', to: 'products#show'



  #requests
  post '/users/:user_id/requests', to: 'requests#create'
  get '/users/:user_id/requests', to: 'requests#index'
  get '/users/:user_id/requests/:request_id', to: 'requests#show'

  put '/users/:user_id/requests/accept/:request_id', to: 'requests#accept'
  put '/users/:user_id/requests/decline/:request_id', to: 'requests#decline'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
