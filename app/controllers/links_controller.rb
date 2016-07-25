class LinksController < ApplicationController
  def index
    if current_user
      @links = current_user.links
      @link = current_user.links.build
    else
      redirect_to signin_path
    end
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to root_path
    else
      flash[:error] = @link.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end

  def update

  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
