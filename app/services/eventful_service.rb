class EventfulService < ApplicationRecord
  def search_events(zip)
    Faraday.get("")
  end
end
