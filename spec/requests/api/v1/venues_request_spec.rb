require 'rails_helper'

RSpec.describe "Venues Api" do
  it "When I send a GET request to /api/v1/venues I receive a 200 JSON response containing all items And each venue has an id, name, address, url, latitude, and longitude, but not the created_at or updated_at" do

    venue1 = Venue.create(name: "Party House", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251")

    get "/api/v1/venues"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.status).to eq(200)
    expect(json.count).to eq(venues.count)
  end

end
