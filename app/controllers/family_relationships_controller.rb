class FamilyRelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @family = Family.find(params[:follower_id])
    current_family.follow(@family)
  end

  def destroy
    @family = current_family.following_relationships.find(params[:id]).follower
    current_family.unfollow(@family)
  end
end
