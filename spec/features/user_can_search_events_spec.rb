require 'rails_helper'

RSpec.feature "user can search events" do
  it "finds events near zip 80202" do

    visit '/'

    expect(page).to have_button("Find Events")
  end

  it "can enter initiate search" do

    visit '/'

    find(:css, "input[id$='q']").set("80202")
    click_button "Find Events"

    expect(current_path).to eq(search_path)
  end

  it "sees a list of 16 events sorted by populatiry with a header `288 events for March`" do

    visit '/'

    find(:css, "input[id$='q']").set("80202")
    click_button "Find Events"
    save_and_open_page
    expect(page).to have_content("288 events for March")
    expect(page).to have_content("Event name")
    expect(page).to have_content("Date and time")
    expect(page).to have_content("Event description")
    expect(page).to have_content("Venue url")
    expect(page).to have_content("Venue address")
  end
end



# And I can see a list of 16 events sorted by popularity with a header `288 events for March`.
# For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
