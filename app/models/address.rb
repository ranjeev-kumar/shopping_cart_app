class Address < ActiveRecord::Base
  
  # Association
  belongs_to :user
  has_many :user_orders

end
