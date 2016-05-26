class OrderDetail < ActiveRecord::Base
  belongs_to :user_order
  belongs_to :product
end
