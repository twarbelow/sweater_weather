class ImageFacade
  def self.get_image(location)
    response = ImageService.search_images(location)
    ImagePoro.new(response, location)
  end
end
