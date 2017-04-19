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
    expect(json["id"]).to eq(venue1.id)
    expect(json["name"]).to eq(venue1.name)
    expect(json["url"]).to eq(venue1.url)
    expect(json["address"]).to eq(venue1.address)
    expect(json["latitude"]).to eq(venue1.latitude)
    expect(json["longitude"]).to eq(venue1.longitude)
    expect(json["id"]).to_not eq(venue2.id)
    expect(json["name"]).to_not eq(venue2.name)
  end

  it "When I send a DELETE request to /api/v1/venues/1 I receive a 204 JSON response if the record is successfully deleted" do

    venue1 = Venue.create(name: "Party House", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251")
    venue2 = Venue.create(name: "Blakement", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251")

    expect(Venue.all.count).to eq(2)

    delete "/api/v1/venues/#{venue1.id}"

    expect(Venue.all.count).to eq(1)
    expect(response).to be_success
    expect(response.status).to eq(204)
  end

  it "When I send a POST request to /api/v1/venues with a name, address, url, latitude, and longitude I receive a 201 JSON response if the record is successfully created And I receive a JSON response containing the id, name, url, latitude, and longitude, but not the created_at or updated_at" do
    venue1 = Venue.create(name: "Party House", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251")

    new_venue = {venue: {name: "Blakement", address: "1510 Blake St", url: "https://www.turing.io", latitude: "39.739236", longitude: "-104.990251"}}

    expect(Venue.all.count).to eq(1)

    post "/api/v1/venues", new_venue

    json = JSON.parse(response.body)
    new_venue_json = json

    expect(response).to be_success
    expect(response.status).to eq(201)
    expect(Venue.all.count).to eq(2)
    expect(new_venue_json["name"]).to eq(new_venue[:venue][:name])
    expect(new_venue_json["url"]).to eq(new_venue[:venue][:url])
    expect(new_venue_json["address"]).to eq(new_venue[:venue][:address])
    expect(new_venue_json["latitude"]).to eq(new_venue[:venue][:latitude])
    expect(new_venue_json["longitude"]).to eq(new_venue[:venue][:longitude])
  end
end
