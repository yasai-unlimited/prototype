class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :album, foreign_key: 'album_id'
end
