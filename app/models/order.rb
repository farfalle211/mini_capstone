class Order < ApplicationRecord

  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

def initialize(input_options)
  super
  calculate_totals
end

def calculate_subtotal
  self.subtotal = carted_products.sum { |carted_product| carted_product.subtotal }
end

def calculate_tax
  self.tax = subtotal * 0.09
end


def calculate_total
  self.total = subtotal + tax
end

def associate_cart
  user.cart.each do |carted_product| 
    carted_product.update(status: "purchased", order_id: self.id)
  end
end


def calculate_totals
  self.save
  self.associate_cart
  self.calculate_subtotal
  self.calculate_tax
  self.calculate_total
  self.save
end

end
