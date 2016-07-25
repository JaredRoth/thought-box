class Api::V1::LinksController < Api::ApiController
  respond_to :json

  def update
    link = Link.find(params[:id])
    link.update(read: !link.read)
    respond_with link
  end
end
