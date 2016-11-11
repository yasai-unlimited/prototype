class FamilyPostsController < ApplicationController
  def create
    @family_post = current_family.family_posts.build(family_post_params)
    if @family_post.save
      if params[:images]
        params[:images].each { |image|
          @family_post.family_post_images.create(image: image)
        }
      end
      flash[:success] = "投稿しました！"
      redirect_to request.referrer || 'families/show'
    else
      flash[:error] = "投稿に失敗しました。改めて投稿し直してください。"
    end
  end

  def destroy
    @family_post = current_family.family_posts.find_by(id: params[:id])
    return redirect_to 'families/show' if @family_post.nil?
    @family_post.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to request.referrer || 'families/show'
  end

  private
  def family_post_params
    params.require(:family_post).permit(:family_id, :content, :stars_count, :friend_open, :general_open, :images => [])
  end
end
