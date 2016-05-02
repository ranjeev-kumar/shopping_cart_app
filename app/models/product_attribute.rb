class ProductAttribute < ActiveRecord::Base

  # Associations
  has_many :product_attribute_associations
  has_many :products, through: :product_attribute_associations
  has_many :attribute_values

  # Validations
  validates :name, presence: true, length: { in: 3..30}
  
end
