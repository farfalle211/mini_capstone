class Api::ProductsController < ApplicationController
  def index
      @products = Product.all

      search_terms = params[:search]
      if search_terms
          @products = @products.where("name iLike ?", "%#{search_terms}%")
      end

      price_ascending = params[:sort]
      if price_ascending == "price" 
          @products = @products.order(:price => :asc)   #.order and .where --> these are Active Record methods that convert Ruby to SQL?
      end

      price_sort = params[:sort_order]
      if price_ascending == "price" && price_sort == "desc"
        # --> isn't this asking it to sort in asc and desc?
          @products = @products.order(:price => :desc)
      end





      @products = @products.order(:id => :asc)


      render 'index.json.jbuilder'
  end

  def show
      product_id = params[:id]
      @product = Product.find(product_id)
      render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            image_url: params[:image_url],
                            description: params[:description]
                            )

    if @product.save
    render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock


    if @product.save
    render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end


  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Successfully removed recipe"}
    
  end

end
