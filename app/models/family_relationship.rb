class FamilyRelationship < ActiveRecord::Base
  belongs_to :follow, class_name: 'Family'
  belongs_to :follower, class_name: 'Family'
end
