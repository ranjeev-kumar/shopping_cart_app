class Product < ActiveRecord::Base
  # has_and_bolongs_to_many :categories
  has_many :images

  validates_presence_of :name, :description, :price
  validates :name, length: { minimum: 3, too_short: "should be atleast 3 characters long."}
  validates :name, length: { maximum: 3, too_short: "should be atmost 255 characters long."}
end
