class BackgroundsController
  def show
    image = ImageFacade.get_image(params[:location])
    render json: BackgroundsSerializer.new(image).serialized_json
  end
end
