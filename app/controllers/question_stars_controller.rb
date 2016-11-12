class QuestionStarsController < ApplicationController
  before_action :set_question
  def create
    current_family.question_star(@question)
    @question_stars_count = @question.question_stars.count
  end

  def destroy
    current_family.question_unstar(@question)
    @question_stars_count = @question.question_stars.count
  end

  private
  def set_question
    @question = Question.find(params[:question_id])
  end
end
