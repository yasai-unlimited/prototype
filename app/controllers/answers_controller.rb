class AnswersController < ApplicationController
  def create
    my_family = current_family
    @answer = my_family.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      flash[:success] = "質問に回答しました！"
      redirect_to request.referrer || 'questions/index'
    else
      flash[:error] = "質問の回答に失敗しました。改めて回答し直してください。"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    current_family.delete_answer(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:user_id, :family_id, :question_id, :content)
  end
end
