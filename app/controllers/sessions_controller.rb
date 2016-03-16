class SessionsController < ApplicationController
  
  def new
    if !logged_in?
      render 'new'
    else
      flash[:success] = "Already logged in"
      redirect_to root_path
    end
  end
  
  def create
    if !logged_in?
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        flash[:success] = "You have succesfully logged in"
        log_in user
    	  params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    	  redirect_to user
      else
        flash.now[:danger] = "There was something wrong with your login information"
        render 'new'
      end
    else
      flash[:success] = "Already logged in"
      redirect_to root_path
    end
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = "You have sucessfully logged out"
    redirect_to root_url
  end
end
