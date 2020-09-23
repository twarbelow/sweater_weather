require 'rails_helper'

RSpec.describe "trails endpoint" do
  it "should return current forecast, name/difficulty/location/estimated travel time for each trail" do
    location = "denver, co"
    headers = { "ACCEPT" => "application/json",
                "CONTENT_TYPE" => "application/json" }

    GET "/api/v1/trails?location=#{location}", headers: headers

    info = JSON.parse(response.body, symbolize_names: true)

    expect(info.keys).to include()



  end
end

Your response should be in the format below:
{
  "data": {
    "id": "null",
    "type": "trail",
    "attributes": {
      "location": "denver,co",
      "forecast": {
        "summary": "Cloudy with a chance of meatballs",
        "temperature": "83"
      },
      "trails": [
        {
          "name": "Boulder Skyline Traverse",
          "summary": "The classic long mountain route in Boulder."
          "difficulty": "black"
          "location": "Superior, Colorado"
          "distance_to_trail": "23.008"
        },
        {
          "name": "Bear Peak Out and Back",
          "summary": "A must-do hike for Boulder locals and visitors alike!"
          "difficulty": "black"
          "location": "Boulder, Colorado"
          "distance_to_trail": "30.098"
        },
        {...}
      ]
    }
  }
}
