class SearchController < ApplicationController
  def index
    @search = Search.find_events(params[:q])
    @total = Search.total(params[:q])
  end
end
