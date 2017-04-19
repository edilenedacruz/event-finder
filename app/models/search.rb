class Search
  attr_reader :name, :date, :description, :address, :url
  def initialize(attributes)
    @name = attributes["title"]
    @date = attributes["start_time"]
    @description = attributes["description"]
    @address = attributes["venue_address"]
    @url = attributes["url"]
  end

  def self.find_events(zip)
    EventfulService.search_events(zip)["event"].map do |event|
      Search.new(event)
    end
  end

  def self.total(zip)
    EventfulService.total(zip)
  end
end
