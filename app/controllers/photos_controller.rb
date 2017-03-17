class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "Success, New Photo added to your gallery"
      redirect_to new_photo_path
    else
      flash[:danger] = "Incorrect Gallery title/description. Please try again."
      redirect_to new_gall_path
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

end
