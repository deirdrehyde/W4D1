class ArtworksController < ApplicationController
  before_action :selected_artwork, only: [:show, :update, :destroy]

  def index
    @artworks = Artwork.all
    render json: @artworks
    # render text: "Deirdre and Chris are the best!!!"
  end

  def create
    @artwork = Artwork.new(artworks_params)

    if @artwork.save
      render json: @artwork
    else
      render( json: @artwork.errors.full_messages, status: :unprocessable_entity )
    end

  end

  def show
    if @artwork
      render json: @artwork
    end
  end

  def update
    if @artwork.update_attributes(artworks_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 400
    end
  end

  def destroy
    if @artwork.destroy
      render json: @artwork
    end
  end

  private

  def artworks_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

  def selected_artwork
    @artwork = Artwork.find_by(id: params[:id])
    unless @artwork
      render json: ["This user is no longer awesome."], status: 404
    end
  end
end
