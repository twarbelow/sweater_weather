require 'rails_helper'

RSpec.describe ImagePoro do
  it "is initialized with id, location, image_url, source, author, and logo can be read" do
    info = {hits: [{largeImageURL: "www.whatever.com.yo.png", user: "whatacooldude"}]}
    location = "colorado, co"

    image = ImagePoro.new(info, location)

    expect(image.id).to eq("null")
    expect(image.location).to eq(location)
    expect(image.image_url).to eq(info[:hits][0][:largeImageURL])
    expect(image.source).to eq("pixabay.com")
    expect(image.author).to eq(info[:hits][0][:user])
    expect(image.logo).to eq("https://pixabay.com/static/img/logo_square.png")
  end
end
