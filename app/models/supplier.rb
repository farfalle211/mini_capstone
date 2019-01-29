class Supplier < ApplicationRecord

has_many :products

  def products
    Product.where(supplier_id: self.id)  #.where and .find_by are both ActiveRecord queries  
    #all products where the supplier_id is this suppliers id
    
  end
end
