class ArtistsController < ApplicationController

  before_action :find_artist, only: [:edit, :show, :update, :delete]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(accepted_params)
    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
    find_artist.update(accepted_params)
    redirect_to artist_path(@artist)
  end

  private
  def accepted_params
    params.require(:artist).permit(:name, :bio)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
