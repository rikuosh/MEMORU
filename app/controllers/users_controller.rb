class UsersController < ApplicationController
  before_action :set_user, only: [:favorites]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end
  
  def follows
    user = User.find(params[:id])
    @users = user.following_user
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.follower_user
  end
  
  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_image_id)
    @favorite_post_images = PostImage.find(favorites)
  end
  
  
 private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
