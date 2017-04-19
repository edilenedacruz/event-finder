require 'rails_helper'

RSpec.describe "Venues Api" do
  it "When I send a GET request to /api/v1/venues I receive a 200 JSON response containing all items And each venue has an id, name, address, url, latitude, and longitude, but not the created_at or updated_at" do

    venue1 = Venue.create(name: "Party House", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251")
    venue2 = Venue.create(name: "Blakement", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251")

    get "/api/v1/venues"

    json = JSON.parse(response.body)
    first_venue = json.first
    expect(response).to be_success
    expect(response.status).to eq(200)
    expect(json.count).to eq(2)
    expect(first_venue["id"]).to eq(venue1.id)
    expect(first_venue["name"]).to eq(venue1.name)
    expect(first_venue["url"]).to eq(venue1.url)
    expect(first_venue["address"]).to eq(venue1.address)
    expect(first_venue["latitude"]).to eq(venue1.latitude)
    expect(first_venue["longitude"]).to eq(venue1.longitude)
  end

  it "When I send a GET request to /api/v1/venues/1 I receive a 200 JSON response containing the id, name, address, url, latitude, and longitude, but not the created_at or updated_at" do

    venue1 = Venue.create(name: "Party House", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251")
    venue2 = Venue.create(name: "Blakement", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251")

    get "/api/v1/venues/#{venue1.id}"

    json = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(response.status).to eq(200)

  end

end
