class Supplier < ApplicationRecord

  def products
    Product.where(supplier_id: self.id)  #.where and .find_by are both ActiveRecord queries
    
  end
end
