# frozen_string_literal: true

class GenresController < ApplicationController
  def index
    @genres = current_user.genres
    @genre = Genre.new
  end

  def create
    @genres = current_user.genres
    @genre = current_user.genres.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
