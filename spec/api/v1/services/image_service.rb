require 'rails_helper'

RSpec.describe 'ImageService' do
  it 'returns image service when provided with a serach term' do
    VCR.use_cassette('image_service, :match_requests_on => [:method, :path], :record => :new_episodes) do
      location = "denver, co"
      returned = ImageService.search_images(location)
      expect(returned).to be_a(Hash)
      expect(returned[:hits][0]).to include(:largeImageURL)
      expect(returned[:hits][0]).to include(:user)
      expect(returned[:hits][0]).to include(:type => "photo")
    end
  end
end
