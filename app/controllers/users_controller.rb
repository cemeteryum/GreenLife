class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: :destroy
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:sucess] = "Welcome to the jungle #{@user.username}"
      redirect_to root_path #redirect_to @user || redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your account has been updated sucessfully"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def show
    #@user = User.find(params[:id])
    #@user = User.find_by(username: params[:username])
    @articles = Article.all.where(user_id: @user.id) #find_by(user_id: @user.id)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = "User and all articles have been deleted"
    redirect_to users_url
  end
  
  def set_user
    @user = User.find(params[:id])
    #@user = User.find_by(username: params[:username])
  end
  
  private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
		def require_same_user
		  if !logged_in? && current_user != @user and !current_user.admin?
		    flash[:danger] = "You can only edit your own account"
		    redirect_to root_path
		  end
		end
		def require_admin
		  if logged_in? and !current_user.admin?
		    flash[:danger] = "Only admin users cand perform that action"
		    redirect_to root_path #redirect_to(root_url) unless current_user.admin?
		  end
		end
		def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end