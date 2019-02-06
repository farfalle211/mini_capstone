json.id carted_product.id
json.quantity carted_product.quantity
json.status carted_product.status
json.user_id carted_product.user_id

json.product do
  json.partial! carted_product.product, partial: 'api/products/product', as: :product  #need api/products/product because product is not in the same folder. 
end
