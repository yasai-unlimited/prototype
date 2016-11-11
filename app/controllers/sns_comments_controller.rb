class SnsCommentsController < ApplicationController
  def create
    my_family = current_family
    @sns_comment = my_family.sns_comments.build(sns_comment_params)
    @sns_comment.user_id = current_user.id
    if @sns_comment.save
      flash[:success] = "投稿しました！"
      redirect_to request.referrer || 'families/timeline'
    else
      flash[:error] = "投稿に失敗しました。改めて投稿し直してください。"
    end
  end

  def destroy
    @family_post = FamilyPost.find(params[:family_post_id])
    current_family.delete_sns_comment(@family_post)
  end

  private
  def sns_comment_params
    params.require(:sns_comment).permit(:user_id, :family_id, :family_post_id, :content)
  end

end
