class ProductAttribute < ActiveRecord::Base

  has_many :product_attribute_assocations
  has_many :products, through: :product_attribute_assocations
  has_many :attribute_values
  
end
