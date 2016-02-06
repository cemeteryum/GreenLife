class SessionsController <  ApplicationController

  def new
  end

  def create
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
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = "You have sucessfully logged out"
    redirect_to root_url
  end

end