class Question < ActiveRecord::Base
  belongs_to :family
  belongs_to :user

  has_many :question_images, dependent: :destroy

  has_many :question_stars, class_name: QuestionStar, dependent: :destroy, foreign_key: 'question_id'
  has_many :question_star_families, through: :question_stars, source: :family

  def self.ransackable_attributes auth_object = nil
    %w(content)
  end
end
