class ProductAttributeAssociation < ActiveRecord::Base

  self.table_name = "product_attribute_values"

  # Associations
  belongs_to :product
  belongs_to :product_attribute
  belongs_to :attribute_value
  
end
