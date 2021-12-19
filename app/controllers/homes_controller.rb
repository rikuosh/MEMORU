class HomesController < ApplicationController
  
  def top
    @post_images = PostImage.order(created_at: :desc).limit(5)
  end
  
end
