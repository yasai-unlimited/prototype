class FamilyPostImage < ActiveRecord::Base
  belongs_to :family_post
  mount_uploader :image, FamilyPostImageUploader
end
