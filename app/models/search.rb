class Search

  def self.find_events(zip)
    EventfulService.search_events(zip).map do |event|
      binding.pry
      Search.new(event)
      binding.pry
    end
  end
end
