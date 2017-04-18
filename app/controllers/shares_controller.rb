class SharesController < ApplicationController

  def new
    if params[:gall_id]
      @gall = Gall.find(params[:gall_id])
    elsif params[:photo_id]
      @photo = Photo.find(params[:photo_id])
    end
  end

  def create
    if params[:share][:email].blank?
      flash[:warning] = "You need to supply an email address to share with"
      render :new
    end
    binding.pry
    if params[:photo_id]
      @photo = Photo.find(params[:photo_id])
      PhotoMailer.share(@photo, params[:email]).deliver
      flash[:success] = "That photo is _shared_, yo."
      redirect_to @photo # photo_path(@photo)
    elsif params[:gall_id]
      @gall = Gall.find(params[:gall_id])
      GallMailer.share(@gall, params[:email]).deliver
      flash[:success] = "That gallery is _shared_, yo."
      redirect_to @gall # gall_path(@gall)
    else
      flash[:warning] = "Sorry, unable to share at this time"
      render :new
    end
  end
end
