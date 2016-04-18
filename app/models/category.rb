class Category < ActiveRecord::Base
  has_many :subcategories, class_name: "Category", foreign_key: "category_id"
  belongs_to :category, class_name: "Category"
  has_and_belongs_to_many :products
end
