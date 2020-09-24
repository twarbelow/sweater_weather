class ImagePoro
  attr_reader :id, :location, :image_url, :source, :author, :logo

  def initialize(info, location)
    @id = "null"
    @location = location
    @image_url = info[:hits][0][:largeImageURL]
    @source = "pixabay.com"
    @author = info[:hits][0][:user]
    @logo = "https://pixabay.com/static/img/logo_square.png"
  end
end
