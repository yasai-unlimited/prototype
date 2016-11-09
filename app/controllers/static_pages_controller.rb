class StaticPagesController < ApplicationController
  def home
  end

  def timeline
    my_family = current_family
    @family_post = my_family.family_posts.build
    @family_posts = my_family.family_posts.order(created_at: :desc)
  end
end
