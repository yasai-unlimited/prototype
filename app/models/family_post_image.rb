class FamilyPostImage < ActiveRecord::Base
  belongs_to :family_post, :dependent => :destroy
  mount_uploader :image, FamilyPostImageUploader
end
