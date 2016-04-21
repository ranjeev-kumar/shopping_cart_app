class AttributeValue < ActiveRecord::Base

  # Associations
  has_many :product_attribute_associations
  has_many :products, through: :product_attribute_associations
  has_many :product_attributes, through: :product_attribute_associations
  belongs_to :product_attribute

end
