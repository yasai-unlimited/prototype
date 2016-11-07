class Family < ActiveRecord::Base
  mount_uploader :coverimage, FamilyCoverimageUploader

  mount_uploader :icon, FamilyIconUploader

  has_many :users

  has_many :follow_relationships, class_name: 'Relationship',
                                     foreign_key: 'follow_id',
                                     dependent: :destroy
  has_many :follow_families, through: :follow_relationships, source: :follower
  has_many :follower_relationships, class_name: 'Relationship',
                                foreign_key: 'follower_id',
                                dependent: :destroy
  has_many :follower_families, through: :follower_relationships, source: :follow

end
