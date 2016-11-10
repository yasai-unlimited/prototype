class Album < ActiveRecord::Base
  has_many :pictures, dependent: :destroy, foreign_key: 'album_id'

  belongs_to :family, foreign_key: 'family_id'
end
