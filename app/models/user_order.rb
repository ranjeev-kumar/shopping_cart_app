class UserOrder < ActiveRecord::Base
  belongs_to :billing_address, class_name: 'Address', foreign_key: 'billing_address_id'
  belongs_to :shipping_address, class_name: 'Address', foreign_key: 'shipping_address_id'
  has_many :order_details, dependent: :destroy
  belongs_to :user
  belongs_to :coupon
end
