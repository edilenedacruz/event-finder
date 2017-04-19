require 'rails_helper'

RSpec.describe EventfulService do
  it "gives event list" do
    zip = "80202"
    service = EventfulService.search_events(zip)

    total = EventfulService.total(zip)

    expect(total.to_i).to eq(288)
    expect(service.class).to eq(Hash)
  end
end
