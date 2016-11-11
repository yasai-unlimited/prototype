class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :album, foreign_key: 'album_id'
  belongs_to :family, foreign_key: 'family_id'
end
