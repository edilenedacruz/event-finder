Fabricator(:venue) do
  name       Faker::Company.unique.name
  address    Faker::Address.unique.street_address
  url        Faker::Internet.unique.url
  latitude   Faker::Address.unique.latitude
  longitude  Faker::Address.unique.longitude
end
