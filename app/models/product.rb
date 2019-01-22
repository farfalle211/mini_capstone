class Product < ApplicationRecord

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
