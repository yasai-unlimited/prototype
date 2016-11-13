class Question < ActiveRecord::Base
  belongs_to :family
  belongs_to :user

  has_many :question_images, dependent: :destroy

  has_many :question_stars, class_name: QuestionStar, dependent: :destroy, foreign_key: 'question_id'
  has_many :question_star_families, through: :question_stars, source: :family

  def self.ransackable_attributes auth_object = nil
    %w(content)
  end

  has_many :answers, class_name: Answer, foreign_key: 'question_id', dependent: :destroy
  has_many :answered_families, through: :answers, source: :family

  def has_answer?
    answered_families.count != 0
  end
end
