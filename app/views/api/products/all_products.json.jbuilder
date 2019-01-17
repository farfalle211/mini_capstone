json.array! @products.each do |product|    #instance variable only important for moving the data from the controller action into the view, once it's in the view you can work with the data locally. 
  json.id product.id
  json.name product.name
  json.price product.price
  json.image_url product.image_url
  json.description product.description
end

