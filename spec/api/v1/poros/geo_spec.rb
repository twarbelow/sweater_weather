require 'rails_helper'

RSpec.describe GeoPoro do
  it "is initialized with lat and long that can be read" do
    coord_hash = {lat: 239.84723, lng: 837.483}

    geo = GeoPoro.new(coord_hash)
    expect(geo.lat).to eq(coord_hash[:lat])
    expect(geo.long).to eq(coord_hash[:lng])
  end
end
