class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find_by id: params[:followed_id]
    current_user.follow(@user)
    render json: {
      html_content: render_to_string(partial: "users/unfollow"),
      count_follow: @user.followers.size
    }
  end

  def destroy
    @user = (Relationship.find_by id: params[:id]).followed
    current_user.unfollow(@user)
    render json: {
      html_content: render_to_string(partial: "users/follow"),
      count_follow: @user.followers.size
    }
  end
end
