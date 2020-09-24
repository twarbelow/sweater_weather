require 'rails_helper'
require 'vcr'

RSpec.describe ImageFacade do
  it "get_image returns anImagePoro" do
    VCR.use_cassette('image_denver', :match_requests_on => [:method, :path], :record => :new_episodes) do
      location = "denver"

      returned = ImageFacade.get_image(location)

      expect(returned).to be_a(ImagePoro)
    end
  end
end
