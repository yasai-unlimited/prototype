class FamilyPostsController < ApplicationController
  def create
    @family_post = current_family.family_posts.build(family_post_params)
    if params[:images]
      params[:images].each { |image|
        @family_post.family_post_images.build(image: image)
      }
    end

    if @family_post.save
      flash[:success] = "投稿しました！"
      redirect_to request.referrer || 'families/show'
    else
      flash[:error] = "申し訳ありません、投稿に失敗しました。改めて投稿し直してください。"
    end
  end

  def destroy
    @family_post = current_family.family_posts.find_by(id: params[:id])
    return redirect_to 'families/show' if family_posts.nil?
    @family_post.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to request.referrer || 'families/show'
  end

  private
  def family_post_params
    params.require(:family_post).permit(:family_id, :content, :stars_count, family_post_images_attributes: [:image])
  end
end
