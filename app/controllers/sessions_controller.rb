class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/rooms', notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to '/users', notice: "Logged out!"
  end
end
