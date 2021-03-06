class FamilyPostStarsController < ApplicationController
  before_action :set_family_post
  def create
    current_family.family_post_star(@family_post)
    @family_post_stars_count = @family_post.family_post_families.count
  end

  def destroy
    current_family.family_post_unstar(@family_post)
    @family_post_stars_count = @family_post.family_post_families.count
  end

  private
  def set_family_post
    @family_post = FamilyPost.find(params[:family_post_id])
  end
end
