class QuestionImage < ActiveRecord::Base
  belongs_to :question
  mount_uploader :image, QuestionImageUploader
end
