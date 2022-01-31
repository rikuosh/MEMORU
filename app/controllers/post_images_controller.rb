# frozen_string_literal: true

class PostImagesController < ApplicationController

  before_action :authenticate_user!, except:[:show] 

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.all.order(created_at: :desc)
    @tags = PostImage.tag_counts_on(:tags).order('count desc')
    @post_image = PostImage.tagged_with(params[:tag]) if @tag = params[:tag]
  end

  def show
    @post_image = PostImage.find(params[:id])
    @comment = Comment.new
    @tags = @post_image.tag_counts_on(:tags)
  end

  def edit
    @post_image = PostImage.find(params[:id])
    @user = current_user
    if @post_image.user == current_user
      render "edit"
    else
      redirect_to post_images_path
    end

  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_images_path
    else
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :introduction, :tag_list)
  end
end
