Rails.application.routes.draw do
  namespace :api do
  get '/first_product_url' => 'products#first_action'
  get '/all_products' => 'products#all_products'
  get '/display_product' => 'products#display_products_string'
   
  end

end
