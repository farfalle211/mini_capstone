  json.id product.id
  json.name product.name

  json.price product.price
  json.tax product.tax
  json.total product.total

  json.images do
      json.array! product.images, partial: 'api/suppliers/supplier', as: :supplier
  end

  json.description product.description
  json.is_discounted product.is_discounted?
  json.in_stock product.in_stock?
  json.supplier_id product.supplier_id

  json.supplier do 
    json.partial! product.supplier, partial: 'api/suppliers/supplier', as: :supplier
  end


  json.formatted do
  
    json.price number_to_currency(product.price)
    json.tax number_to_currency(product.tax)
    json.total number_to_currency(product.total)

  end
