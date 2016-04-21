class Product < ActiveRecord::Base
  
  # Assosiations
  has_many :cart_items
  has_many :users, through: :cart_items
  has_many :images
  has_many :product_attribute_associations
  has_many :product_attributes, through: :product_attribute_associations
  has_many :attribute_values, through: :product_attribute_associations
  has_and_belongs_to_many :categories

  # Validations
  validates_presence_of :name, :description, :price
  validates :name, length: { minimum: 3, too_short: "should be atleast 3 characters long."}
  validates :name, length: { maximum: 255, too_short: "should be atmost 255 characters long."}

  # Scopes
  scope :category_products, ->(category_id) { joins(:categories).where('categories.category_id = ?', category_id) }

end
