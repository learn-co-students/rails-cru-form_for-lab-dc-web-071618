class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    set_song
    @genre = Genre.find(@song.genre_id)
    @artist = Artist.find(@song.artist_id)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)

    redirect_to song_path(@song)
  end

  def edit
    set_song
  end

  def update
    set_song
    @song.update(song_params)

    redirect_to song_path(@song)
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :genre_id, :artist_id)
  end
end
