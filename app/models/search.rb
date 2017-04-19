class Search

  def initialize(attributes)
    binding.pry
  end
  def self.find_events(zip)
    EventfulService.search_events(zip).map do |event|
      Search.new(event)
      binding.pry
    end
  end

  def self.total(zip)
    EventfulService.total(zip)
  end
end


#["title"]
#["start_time"]
#["description"] to 140 characters
#["venue_address"]
#["venue_name"]
