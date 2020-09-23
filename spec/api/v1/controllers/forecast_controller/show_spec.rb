require 'rails_helper'

RSpec.describe "show action" do
  it "responsds to a get request with properly formatted weather data for the correct location" do
    location = "denver, co"
    headers = { "ACCEPT" => "application/json",
                "CONTENT_TYPE" => "application/json" }
    GET "/api/v1/forecast?location=#{location}", headers: headers

    info = JSON.parse(response.body, symbolize_names: true)

    expect(info.keys).to include()


  end
end
