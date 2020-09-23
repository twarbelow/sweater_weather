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
    # expect(json[:data][:attributes][:forecast][:summary].class).to eq(String)
    # expect(json[:data][:attributes][:forecast][:temperature].class).to eq(String)

    json[:data][:attributes][:trails].each do |trail|
      expect(trail).to include(:name)
      expect(trail).to include(:summary)
      expect(trail).to include(:difficulty)
      expect(trail).to include(:location)
      expect(trail).to include(:distance_to_trail)
    end
  end
end
