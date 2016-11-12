class QuestionsController < ApplicationController
  def create
    @question = current_family.questions.build(question_params)
    if @question.save
      if params[:images]
        params[:images].each { |image|
          @question.question_images.create(image: image)
        }
      end
      flash[:success] = "投稿しました！"
      redirect_to request.referrer || 'families/qa'
    else
      flash[:error] = "投稿に失敗しました。改めて投稿し直してください。"
    end
  end

  def destroy
    @question = current_family.questions.find_by(id: params[:id])
    return redirect_to 'families/qa' if @question.nil?
    @question.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to request.referrer || 'families/qa'
  end

  private
  def question_params
    params.require(:question).permit(:family_id, :content, :stars_count, :friend_open, :general_open, :images => [])
  end
end
