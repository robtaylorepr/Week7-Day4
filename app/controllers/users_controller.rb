class UsersController < ApplicationController

    before_action :find_user, only: [:edit, :show, :update]
    before_action :require_user, only: [:edit, :update]
    before_action :require_self, only: [:edit, :update]

    def marketing
    end

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        # send them an email
        UserMailer.signup(@user).deliver
        session[:user_id] = @user.id
        redirect_to galls_path(@user)
        # redirect_to "/users/#{@user.id}"
        # redirect_to controller: "users", action: "show", id: @user.id

        # url_for(@user)
        #   - Check class name (User)
        #   - "#{class_name}_path(id: thing.id)"
      else
        flash[:danger] = "Incorrect credentials. Please try again."
        redirect_to login_path
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :password, :email)
    end

    def find_user
      @user = User.find(params[:id])
    end

    def require_self
      unless @user == current_user
        flash[:danger] = "Only the owner of that Gallery/Photo may access it"
        redirect_to :root
      end
    end


end
