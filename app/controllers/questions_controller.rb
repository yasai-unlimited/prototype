class QuestionsController < ApplicationController
  def index
    my_family = current_family
    @question = my_family.questions.build
    @answer = my_family.answers.build
    @questions = my_family.all_questions.order(created_at: :desc).page(params[:page])
  end

  def show
    @question = Question.find(params[:id])
    @asked_family = Family.find(@question.family.id)
  end

  def create
    @question = current_family.questions.build(question_params)
    @question.user_id = current_user.id
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

  def search
    @q = Question.ransack(params[:q])
    if params[:q]
      key_words = params[:q][:title_cont].split(/[\p{blank}\s]+/) # params[:q] = 'hello world ruby'
      grouping_hash = key_words.reduce({}){|hash, word| hash.merge(word => { title_cont: word })}
      @q = Question.ransack({ combinator: 'or', groupings: grouping_hash, s: 'content desc' })
    end

    @search_questions = @q.result
  end

  private
  def question_params
    params.require(:question).permit(:family_id, :user_id, :content, :title, :friend_open, :general_open, :family_open, :images => [])
  end
end
