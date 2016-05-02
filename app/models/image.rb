class Image < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  
  # Associaton
  belongs_to :product

  # Validations
  validates_presence_of :name, :main
  validates :name, length: { in: 3..30}

end
