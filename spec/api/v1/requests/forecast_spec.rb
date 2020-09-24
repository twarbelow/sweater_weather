require 'rails_helper'

RSpec.describe "show action" do
  it "responds to a get request with properly formatted weather data for the correct location" do
    location = "denver, co"
    headers = { "ACCEPT" => "application/json",
                "CONTENT_TYPE" => "application/json" }
    get "/api/v1/forecast?location=#{location}", headers: headers

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.keys).to include(:hourly)
    expect(json.keys).to include(:daily)
    expect(json.keys).to include(:current)


  end
end
