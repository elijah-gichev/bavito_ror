Rails.application.routes.draw do

  #login
  post '/auth', to: 'auth#create'
  #registration
  post '/users', to: 'users#create'

  # goods stuff
  post '/goods', to: 'goods#create'
  get '/goods', to: 'goods#index'
  get '/goods/:id', to: 'goods#show'



  #put '/goods/:id', to: 'goods#update'


  #можно ставить статус удалён, но не удалять
  #   delete '/goods/:id', to: 'goods#destroy'


  #requests
  post '/requests', to: 'requests#create'

  get '/requests', to: 'requests#index'

  delete '/requests/:id', to: 'requests#destroy'
  #нужно ещё как-то принимать запрос



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
