class Product < ActiveRecord::Base
  
  has_and_belongs_to_many :categories
  has_many :images
  has_many :product_attribute_associations
  has_many :product_attributes, through: :product_attribute_associations
  has_many :attribute_values, through: :product_attribute_associations

  validates_presence_of :name, :description, :price
  validates :name, length: { minimum: 3, too_short: "should be atleast 3 characters long."}
  validates :name, length: { maximum: 255, too_short: "should be atmost 255 characters long."}

end
