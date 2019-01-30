class Api::OrdersController < ApplicationController

  def create

    product = Product.find(params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price

    calculated_tax = calculated_subtotal * 0.09   #if you times an integer times a float it becomes a float (product becomes a float. Ruby will always go towards the more complex (float in this case))

    #decimals are more specific, floats are fuzzy math --> doesnt work for things like money. Decimal is more specific than float.

    calculated_total = calculated_tax + calculated_subtotal


    @order = Order.new(
                        product_id: params[:product_id],
                        quantity: params[:quantity],
                        user_id: current_user.id,
                        subtotal: calculated_subtotal,
                        tax: calculated_tax,
                        total: calculated_total
                      )
#frontend insomnia request
    if @order.save
      render 'show.json.jbuilder'
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessable_entity
    end
  end 

  def show
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end

  def index
    @orders = Order.all
    render 'index.json.jbuilder'
  end


end
