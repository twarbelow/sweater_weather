class BackgroundController < ApplicationController
  def show
    image = ImageFacade.get_image(params[:location])
    render json: BackgroundSerializer.new(image).serialized_json
  end
end
