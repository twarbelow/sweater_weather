require 'rails_helper'

RSpec.describe "GET /api/v1/backgrounds" do
  it "responds with url of appropriate background image for location requested" do
    location = "denver, co"
    headers = { "ACCEPT" => "application/json",
                "CONTENT_TYPE" => "application/json" }
    get "/api/v1/backgrounds?location=#{location}", headers: headers
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status(200)

    expect(json[:data][:type]).to eq("image")
    expect(json[:data][:id]).to eq(null)
    expect(json[:data][:image][:location]).to eq(location)
    expect(json[:data][:image][:image_url].class).to eq(String)
    expect(json[:data][:image][:credit][:source]).to eq("pixabay.com")
    expect(json[:data][:image][:credit][:author].class).to eq(String)
    expect(json[:data][:image][:credit][:logo]).to eq("https://pixabay.com/static/img/logo_square.png")
  end
end
