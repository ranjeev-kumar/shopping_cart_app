class ProductAttributeAssociation < ActiveRecord::Base

  belongs_to :product
  belongs_to :product_attribute
  belongs_to :attribute_value
  
end
