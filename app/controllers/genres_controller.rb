class GenresController < ApplicationController
  before_action :find_genre, only: [:edit, :show, :update, :delete]

  def index
    @genres = Genre.all
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(accepted_params)
    redirect_to genre_path(@genre)
  end

  def edit
  end

  def update
    find_genre.update(accepted_params)
    redirect_to genre_path(@genre)
  end

  private
  def accepted_params
    params.require(:genre).permit(:name)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end
end
