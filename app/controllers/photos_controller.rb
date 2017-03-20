class PhotosController < ApplicationController
  # before_action

  def new
    @photo = Photo.new
  end

  def create
    @gall = Gall.find(params[:id])
    @photo = @gall.photos.new(photo_params)
    if current_user == @gall.user
      if @photo.save
        if params[:photo][:hit_me] == 0
          flash[:success] = "Success, New Photo added to your gallery"
          redirect_to gall_path
        else
          redirect_to new_photo_path
        end
      end
    else
      flash[:danger] = "Incorrect Gallery title/description. Please try again."
      redirect_to new_gall_path
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

end
