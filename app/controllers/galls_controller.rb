class GallsController < ApplicationController

  def index
    @gall = Gall.all
  end

  def new
    @gall = Gall.new
  end

  def create
    @gall = Gall.new(gall_params)
    @gall.user = current_user
    if @gall.save
      flash[:success] = "Success, New Gallery Created"
      redirect_to new_photo_path
    else
      flash[:danger] = "Incorrect Gallery title/description. Please try again."
      redirect_to new_gall_path
    end
  end

  def gall_params
    params.require(:gall).permit(:title, :description)
  end

end
