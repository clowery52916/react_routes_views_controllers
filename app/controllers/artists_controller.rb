class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @new_artist = Artist.create(artist_params)
    redirect_to "/artists/#{@new_artist.id}"
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to "/artists/#{@artist.id}"
  end

  def destroy
    Artist.find(params[:id]).destroy
    redirect_to "/artists"
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end
