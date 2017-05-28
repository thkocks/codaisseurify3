class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @artists = current_user.artists
  end

  def show
  end

  def new
    @artist = current_user.artists.build
  end

  def create
    @artist = current_user.artists.build(artist_params)

    if @artist.save
      redirect_to @artist, notice: "Artist successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist, notice: "Artist successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])

    @artist.destroy

    redirect_to artists_path
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :artist_genres, :image_url, :bio)
    end
end
