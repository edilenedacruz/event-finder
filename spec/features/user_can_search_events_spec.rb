require 'rails_helper'

RSpec.feature "user can search events" do
  it "finds events near zip 80202" do

    visit '/'

    expect(page).to have_button("Find Events")
  end

  it "can enter initiate search" do

    visit '/'

    fill_in
  end
end
#
# As a user,
# When I fill in the search with 80202,
# And I click Find Events,
# The current path is `/search`,
# And I can see a list of 16 events sorted by popularity with a header `288 events for March`.
# For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
