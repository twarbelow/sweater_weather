require 'rails_helper'

RSpec.describe "trails endpoint" do
  it "should return current forecast, name/difficulty/location/estimated travel time for each trail" do
    location = "denver, co"
    headers = { "ACCEPT" => "application/json",
                "CONTENT_TYPE" => "application/json" }

    get "/api/v1/trails?location=#{location}", headers: headers

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq("trail")
    expect(json[:data][:attributes][:location]).to eq(location)
    expect(json[:data][:attributes][:forecast][:summary].class).to eq(String)
    expect(json[:data][:attributes][:forecast][:temperature].class).to eq(String)

    jason[:trails].each do |trail|
      expect(trails).to include(:name)
      expect(trails).to include(:summary)
      expect(trails).to include(:difficulty)
      expect(trails).to include(:location)
      expect(trails).to include(:distance_to_trail)
    end
  end
end

#will need temp and summary from weather
#will need name summary difficulty and location from trails
#will use each trail location and original location to get distance_to_trail
  # https://www.mapquestapi.com/directions/v2/route?key=KEY&from=Denver%2C+CO&to=Boulder%2C+CO&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false
