class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :url, :latitude, :longitude
end
