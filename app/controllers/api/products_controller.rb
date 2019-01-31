class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  
  def index
      @products = Product.all

      search_keyword = params[:search]   #key needs to be something particular because of the frontend app we are connecting it to, with "search" as the key you put into the URL
      if search_keyword
          @products = @products.where("name iLike ?", "%#{search_keyword}%")  #? sanitizes the inputs #
      end


      discount = params[:discount]
      if discount
          @products = @products.where("price < ?", 10)
      end


      sort_attribute = params[:sort]
      sort_order = params[:sort_order]

      if sort_attribute && sort_order
          @products = @products.order(sort_attribute => sort_order)   
          #price: :desc is Javascript notation. Change to :price => :desc is ruby syntax. then "price" => "desc". If you were to do sort_attribute: :desc, it is looking for an attribute called sort_attribute, but what you want it to do is convert the value that is sort_attribute passed in to be one of the attributes desired. 


          # price: :desc  <-- you want this to be dynamic. 
          # a string is being passed into sort_attribute (in params[:sort] above) and you want that to be dynamic and so must use ruby syntax, because the Javascript syntax takes it in as a symbol (and thus is not reading sort_attribute the string that was passed in at all "not even making it connect with the string passed in") 


          # split .reverse should not be called on a symbol, symbol are characters optimized for memory



          #.order and .where --> these are Active Record methods that convert Ruby to SQL?  
          #you cannot sort by a non attibute (price, name, etc have to be entered as the value)
      elsif sort_attribute
        @products = @products.order(sort_attribute)
      else 
        @products = @products.order(:id)
      end



      price_sort = params[:sort_order]
      if sort_attribute == "price" && price_sort == "desc"
        # --> isn't this asking it to sort in asc and desc?
          @products = @products.order(:price => :desc)
      end


      @products = @products.order(:id)


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
                            description: params[:description],
                            supplier_id: params[:supplier_id]
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
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock
    @product.supplier_id = params[:supplier_id] || @product.supplier_id


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
