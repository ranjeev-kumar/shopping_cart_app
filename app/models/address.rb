class Address < ActiveRecord::Base
  
  # Association
  belongs_to :user
  has_many :user_orders

  # Validations
  validates_presence_of :address_1, :city, :state, :country, :zipcode
  validates :city, length: { minimum: 3}, format: { with: /[a-zA-Z]+/ }
  validates :state, length: { minimum: 3}, format: { with: /[a-zA-Z]+/ }
  validates :country, length: { minimum: 3}, format: { with: /[a-zA-Z]+/ }
  validates :zipcode,length: { is: 6}, format: { with: /[0-9]+/ }

end
