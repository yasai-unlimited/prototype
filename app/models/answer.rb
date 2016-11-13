class Answer < ActiveRecord::Base
  belongs_to :family
  belongs_to :user
  belongs_to :question
end
