class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  # def new
  # end
  #
  # def index
  #   if current_user
  #     render :new
  #   else
  #     render :new
  #   end
  #
  # end



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      flash[:warning] = "You need to be logged in to do this."
      redirect_to login_path
    end
  end
end
