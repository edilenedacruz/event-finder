require 'rails_helper'

RSpec.describe EventfulService do
  it "gives event list" do
    zip = "80202"
    service = EventfulService.search_events(zip)

    expect(service["total_items"].to_i).to eq(288)
  end
end
