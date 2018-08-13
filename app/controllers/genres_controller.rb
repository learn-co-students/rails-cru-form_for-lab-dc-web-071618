class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  def edit
    ga
  end

  def update
    ga
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  def show
    ga
  end

  private

  def ga
    @genre = Genre.find(params[:id])
  end

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

end
