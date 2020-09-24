require 'rails_helper'
require 'vcr'

RSpec.describe GeoFacade do
  it "get_image returns a GeoPoro" do
    VCR.use_cassette('geo_denver', :match_requests_on => [:method, :path], :record => :new_episodes) do
      location = "denver, co"

      returned = GeoFacade.get_coords(location)

      expect(returned).to be_a(GeoPoro)
    end
  end
end
