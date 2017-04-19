require 'rails_helper'

RSpec.describe EventfulService do
  before(:each) do
    @event_service = EventfulService.get
  end

end
