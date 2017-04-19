class Search

  def self.find_events(zip)
    EventfulService.search_events(zip).map do |event|
      Search.new(event)
    end
  end
end
