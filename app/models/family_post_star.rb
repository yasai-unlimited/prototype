class FamilyPostStar < ActiveRecord::Base
  belongs_to :family
  belongs_to :family_post
end
