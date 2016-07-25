class SessionsController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
