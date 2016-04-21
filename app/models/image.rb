class Image < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  
  # Associaton
  belongs_to :product

end
