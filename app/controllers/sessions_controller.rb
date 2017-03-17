class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to @user
    else
      flash[:danger] = "Incorrect credentials. Please try again."
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end
