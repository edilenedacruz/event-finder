class SearchController < ApplicationController
  def index
    @search = Search.find_events(zip)
  end
end
