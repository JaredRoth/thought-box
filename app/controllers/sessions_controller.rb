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
      # flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
