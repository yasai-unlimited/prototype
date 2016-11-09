class FamilyPost < ActiveRecord::Base
  belongs_to :family, dependent: :destroy
  validates :content, presence: true, length: { maximum: 200 }

  has_many :family_post_images
  accepts_nested_attributes_for :family_post_images, allow_destroy: true
end
