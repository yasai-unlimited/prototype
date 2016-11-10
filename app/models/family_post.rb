class FamilyPost < ActiveRecord::Base
  belongs_to :family
  validates :content, presence: true, length: { maximum: 200 }

  has_many :family_post_images, dependent: :destroy
  accepts_nested_attributes_for :family_post_images

  has_many :family_post_stars, class_name: FamilyPostStar, foreign_key: 'family_post_id', dependent: :destroy
  has_many :family_post_families, through: :family_post_stars, source: :family

  has_many :sns_comments, class_name: SnsComment, foreign_key: 'family_post_id', dependent: :destroy
  has_many :sns_comments_families, through: :sns_comments, source: :family
end
