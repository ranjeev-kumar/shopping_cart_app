class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses

  validates_presence_of :fname, :lname, :phone
  validates :fname, length: { minimum: 3, too_short: "should be atleast 3 characters long."}, format: { with: /[a-zA-Z]+/ }
  validates :lname, length: { minimum: 3, too_short: "should be atleast 3 characters long."}, format: { with: /[a-zA-Z]+/ }
  validates :phone, length: { minimum: 10, too_short: "should be atleast 10 digits long."}, format: { with: /\A[7-9]{1}[0-9]+/ }
end
