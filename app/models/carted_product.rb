class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :order, optional: true 
  belongs_to :product

  def subtotal
    product.price * quantity
    
  end
end
