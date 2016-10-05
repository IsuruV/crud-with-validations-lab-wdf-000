require 'pry'
class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to songs_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.title = params[:title]
    @song.released = params[:released]
    @song.release_year = params[:release_year]
    @song.genre = params[:genre]
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end

  end

  def song_params
    params[:song].permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
