class Image < ApplicationRecord
  belongs_to :product


  # def product
  #   Product.find_by(id: self.product_id)   #an image only has one image associated with it
  # end
end
