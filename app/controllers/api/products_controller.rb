class Api::ProductsController < ApplicationController
  def product_action
    @product = Product.all
    render 'one_product_view.json.jbuilder'



end
