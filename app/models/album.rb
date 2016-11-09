class Album < ActiveRecord::Base
  has_many :pictures, dependent: :destroy

  belongs_to :family, foreign_key: 'family_id'
end
