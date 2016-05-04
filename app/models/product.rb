class Product < ActiveRecord::Base
  
  # Assosiations
  has_many :cart_items
  has_many :users, through: :cart_items
  has_many :images, dependent: :destroy
  has_many :product_attribute_associations, dependent: :destroy
  has_many :product_attributes, through: :product_attribute_associations
  has_many :attribute_values, through: :product_attribute_associations
  has_many :wish_lists
  has_and_belongs_to_many :categories

  # Validations
  validates_presence_of :name, :description, :price
  validates :name, length: { in: 3..30}
  validates :description, length: { in: 10..255}
  validates :price, format: { with: /\d+(\.\d{1,2})?/}
  

  # Scopes
  scope :category_products, ->(category_id) { joins(:categories).where('categories.category_id = ?', category_id) }

end
