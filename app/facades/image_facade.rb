class ImageFacade
  def self.get_image(location)
    response = ImageService.search_images(location)
    require 'pry'; binding.pry
    ImagePoro.new(response, location)
  end
end
