class RelationshipsController < ApplicationController
  def followers
  	@user = User.find(params[:user_id])
  	@followers = @user.followers
  	@book = Book.new
  end

  def follows
  	@user = User.find(params[:user_id])
  	@follows = @user.followings
  	@book = Book.new
  end

  def create
  	user = User.find(params[:user_id])
  	follow = current_user.active_relationships.new(following_id: user.id)
  	follow.save!
  	redirect_back(fallback_location: root_path)
  end

  def destroy
  	user = User.find(params[:user_id])
  	follow = current_user.active_relationships.find_by(following_id: user.id)
  	follow.destroy
  	redirect_back(fallback_location: root_path)
  end
end
