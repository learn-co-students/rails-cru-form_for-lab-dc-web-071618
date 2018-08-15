class SongsController < ApplicationController
  before_action :find_song, only: [:edit, :show, :update, :delete]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(accepted_params)
    redirect_to song_path(@song)
  end

  def edit
  end

  def update
    find_song.update(accepted_params)
    redirect_to song_path(@song)
  end

  private
  def accepted_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
