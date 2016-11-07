class Family < ActiveRecord::Base
  mount_uploader :coverimage, FamilyCoverimageUploader

  mount_uploader :icon, FamilyIconUploader

  has_many :users

end
