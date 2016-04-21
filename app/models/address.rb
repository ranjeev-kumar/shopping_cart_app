class Address < ActiveRecord::Base
  
  # Association
  belongs_to :user

end
