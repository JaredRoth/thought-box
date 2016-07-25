class LinksController < ApplicationController
  def index
    unless current_user
      redirect_to signin_path
    end
  end
end
