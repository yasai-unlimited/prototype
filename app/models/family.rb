class Family < ActiveRecord::Base
  mount_uploader :coverimage, FamilyCoverimageUploader

  mount_uploader :icon, FamilyIconUploader

  has_many :users

  has_many :following_relationships, class_name: 'FamilyRelationship',
                                     foreign_key: 'follow_id',
                                     dependent: :destroy
  has_many :following_families, through: :following_relationships, source: :follower
  has_many :follower_relationships, class_name: 'FamilyRelationship',
                                foreign_key: 'follower_id',
                                dependent: :destroy
  has_many :follower_families, through: :follower_relationships, source: :follow

  def follow(another_family)
    following_relationships.find_or_create_by(follower_id: another_family.id)
  end

  def unfollow(another_family)
    follow_relationship = following_relationships.find_by(follower_id: another_family.id)
    follow_relationship.destroy if follow_relationship
  end

  def following?(another_family)
    following_families.include?(another_family)
  end

  def has_family_relationship?(another_family)
    following?(another_family) && another_family.following?(self)
  end

  has_many :family_posts, dependent: :destroy

  has_many :family_post_stars, class_name: FamilyPostStar, foreign_key: 'family_id', dependent: :destroy
  has_many :stared_family_posts, through: :family_post_stars, source: :family_post

  def family_post_star(family_post)
    family_post_stars.find_or_create_by(family_post_id: family_post.id)
  end

  def family_post_unstar(family_post)
    family_post = family_post_stars.find_by(family_post_id: family_post.id)
    family_post.destroy if family_post
  end

  def family_post_stared?(family_post)
    stared_family_posts.include?(family_post)
  end
end
