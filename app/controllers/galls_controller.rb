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
      redirect_to galls_path(current_user, @gall)
    else
      flash[:danger] = "Incorrect Gallery title/description. Please try again."
      redirect_to new_user_gall_path(@gall)
    end
  end

  def show
    # binding.pry
    @gall = Gall.find(params[:id])
  end

  def gall_params
    params.require(:gall).permit(:title, :description)
  end

end
