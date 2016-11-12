class Question < ActiveRecord::Base
  belongs_to :family
  belongs_to :user

  has_many :question_images, dependent: :destroy
end
