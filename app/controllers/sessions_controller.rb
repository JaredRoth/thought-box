class SessionsController < ApplicationController
  def index

  end

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Log in info does not match our records"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
