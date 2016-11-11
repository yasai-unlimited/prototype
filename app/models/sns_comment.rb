class SnsComment < ActiveRecord::Base
  belongs_to :family
  belongs_to :family_post
  belongs_to :user
end
