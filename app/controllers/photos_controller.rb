class PhotosController < ApplicationController
  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.create(photos_params)
    if @photo.save
      flash[:success] = "Photo is uploaded"
      redirect_to photo_path(@photo)
    else
      render 'new'
    end
  end
  
  def show
    @photo = current_user.photos.find(params[:id])
  end

  def index
    @photos = current_user.photos.all
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private
   def photos_params
    params.require(:photo).permit(:image) if params[:photo]
  end
end
