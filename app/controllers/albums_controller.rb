class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @albums = current_user.albums
  end

  def show
  end

  def new
    @album = current_user.albums.build
  end

  def create
    @album = current_user.albums.build(album_params)

    if @album.save
      redirect_to @album, notice: "Album successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Album successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])

    @album.destroy

    redirect_to albums_path
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, :genre, :image_url, :release_date)
    end
end
