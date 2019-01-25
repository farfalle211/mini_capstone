class Product < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 254 }
    validates :name, uniqueness: true

    validates :price, presence: true
    validates :price, numericality: { less_than: 100_000_000, greater_than: 0 }  #100,000,000 this is the maximum our app can accept, less than 100 million. (according to scale and precision (8 chars to the left of the decimal))

    validates :description, presence: true
    validates :description, length: { in: 10..300 }

  def supplier
    Supplier.find_by(id: self.supplier_id)   #self here refers to a product object. It is a product object because you are in the Produt class. 
  end

  def is_discounted?
    price < 10    #the < returns true or false 
  end

  def tax
    return price * 0.09
  end

  def total
    return price + tax   #can I call the method tax?  #calling the reader method for the price attribute and calling the tax method up above. 
  end


end
