class SharesController < ApplicationController

  def new
    @gall = current_user.galls.last
    # binding.pry
  end

  def create
    if params[:share][:email].blank?
      flash[:warning] = "You need to supply an email address to share with"
      render :new
    end
    if params[:share][:photo_id]
      @photo = Photo.find(params[:share][:photo_id])
      PhotoMailer.share(@photo, params[:share][:email]).deliver
      flash[:success] = "That thing is _shared_, yo."
      redirect_to @photo # photo_path(@photo)
    elsif params[:share][:gall_id]
      # it = params[:share][:gall_id]
      # binding.pry
      @gall = Gall.find(params[:share][:gall_id])
      GallMailer.share(@gall, params[:share][:email]).deliver
      flash[:success] = "That thing is _shared_, yo."
      redirect_to @gall # gall_path(@gall)
    else
      flash[:warning] = "Sorry, unable to share at this time"
    end
  end
end
