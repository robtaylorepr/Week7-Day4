class PhotosController < ApplicationController
  # before_action

  def new
    @photo = Photo.new
  end

  def create
    @gall = Gall.find(params[:id])
    @photo = @gall.photos.new(photo_params)
    if current_user == @photo.user
      if @photo.save
        flash[:success] = "Success, New Photo added to your gallery"
        redirect_to new_photo_path
      end
    else
      flash[:danger] = "Incorrect Gallery title/description. Please try again."
      redirect_to new_gall_path
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image, :id)
  end

end
