class Api::OrdersController < ApplicationController

  before_action :authenticate_user

  def create

      @order = Order.new( user_id: current_user.id )
      render 'show.json.jbuilder'
  end 

  def show
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end

  def index
      @orders = current_user.orders
      render 'index.json.jbuilder'
  end


end
