class User < ApplicationRecord
  has_secure_password

  has_many :carted_products #we would like this to populate all current carted products
  has_many :orders
  
  has_many :products, through: :carted_products

  validates :email, presence: true, uniqueness: true

  def cart
    carted_products.where(status: "carted")
    
  end


end
