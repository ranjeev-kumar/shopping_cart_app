class Category < ActiveRecord::Base
  
  # Associations
  has_many :subcategories, dependent: :destroy, class_name: "Category", foreign_key: "category_id"
  belongs_to :category, class_name: "Category"
  has_and_belongs_to_many :products

  # Validations
  validates_presence_of :name
  validates :name, length: { in: 2..30}

end
