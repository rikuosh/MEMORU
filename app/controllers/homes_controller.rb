# frozen_string_literal: true

class HomesController < ApplicationController
  def top
    @post_images = PostImage.order(created_at: :desc).limit(4)
  end
end
