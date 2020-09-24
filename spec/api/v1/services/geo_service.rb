require 'rails_helper'

RSpec.describe 'GeoService' do
  it 'returns geo service response when provided with location' do
    VCR.use_cassette('geo_service', :match_requests_on => [:method, :path], :record => :new_episodes) do
      location = "denver, co"
      returned = GeoService.geo_location(location)
      expect(returned).to be_a(Hash)
      expect(returned[:results]).to be_a(Array)
      expect(returned[:results][0][:locations]).to be_a(Array)
      expect(returned[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(returned[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(returned[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
      
      # expect(returned).to include(:results)
      # expect(returned[:results][0]).to include(:locations)
      # expect(returned[:results][0][:locations][0]).to include(:latLng)
      # expect(returned[:results][0][:locations][0][:latLng]).to include(:lat)
      # expect(returned[:results][0][:locations][0][:latLng]).to include(:lng)
    end
  end
end
