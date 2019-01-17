class Api::ProductsController < ApplicationController
  def first_action
    @product = Product.first
    render 'one_product_view.json.jbuilder'
  end

  def all_products
    @products = Product.all
    render 'all_products.json.jbuilder'
  end

  def display_products_string
    id = params[:identifier]
    @product = Product.all.find(id)
    render 'string_image.json.jbuilder'
  end

end
