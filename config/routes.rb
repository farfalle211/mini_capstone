Rails.application.routes.draw do
  namespace :api do
    post "/users" => "users#create"
    post '/sessions' => 'sessions#create'

    get '/products' => 'products#index'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'    #this :id is being set to the number that is entered in the browser or Get request
    patch '/products/:id' => 'products#update'   
    delete '/products/:id' => 'products#destroy'

    get '/orders' => 'orders#index'
    post '/orders/' => 'orders#create'
    get '/orders/:id' => 'orders#show'

    get '/carted_products' => 'carted_products#index'
    post '/carted_products' => 'carted_products#create'
    delete '/carted_products/:id' => 'carted_products#destroy'
    
  end
end
