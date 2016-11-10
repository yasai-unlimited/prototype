class FamilyPost < ActiveRecord::Base
  belongs_to :family
  validates :content, presence: true, length: { maximum: 200 }

  has_many :family_post_images, dependent: :destroy
  accepts_nested_attributes_for :family_post_images
end