class QuestionStar < ActiveRecord::Base
  belongs_to :question
  belongs_to :family
end
