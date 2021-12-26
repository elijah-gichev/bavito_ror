Rails.application.routes.draw do

  post '/auth', to: 'auth#create'
  delete '/auth', to: 'auth#destroy'

  #registration
  post '/users', to: 'users#create'

  #dashbord/goods/main
  get '/goods', to: 'goods#index'

  #goods
  #get '/goods/create', to: 'goods#create'
  post '/goods', to: 'goods#create'

  get '/goods/:id/edit', to: 'goods#edit'
  put '/goods/:id', to: 'goods#update'

  get '/goods/:id', to: 'goods#show'
  delete '/goods/:id', to: 'goods#destroy' #можно ставить статус удалён, но не удалять


  #requests
  get '/requests', to: 'requests#index'

  post '/requests/create', to: 'requests#create'
  delete '/requests/:id', to: 'requests#destroy'
  #нужно ещё как-то принимать запрос



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
