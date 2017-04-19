class EventfulService
  def self.search_events(zip)
    response = Faraday.get("http://api.eventful.com/json/events/search?app_key=#{ENV['EVENTFULL_KEY']}&l=80202&t=March+2017&sort_order=popularity&page_size=16")
    parsed = JSON.parse(response.body)["events"]
  end

  def self.total(zip)
    response = Faraday.get("http://api.eventful.com/json/events/search?app_key=#{ENV['EVENTFULL_KEY']}&l=80202&t=March+2017")
    parsed = JSON.parse(response.body)["total_items"]
  end
end
