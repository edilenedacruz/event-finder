class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.all, response: 200
  end

  def show
    render json: Venue.find(params[:id]), response: 200
  end
end
