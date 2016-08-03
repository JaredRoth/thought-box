class LinksController < ApplicationController
  before_action :authorize

  def index
    @links = current_user.links
    @link = current_user.links.build
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

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to root_path
    else
      flash.now[:error] = @link.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
