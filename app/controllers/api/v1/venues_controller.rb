class Api::V1::VenuesController < ApplicationController
  def index
    render json: Venue.all, response: 200
  end

  def show
    render json: Venue.find(params[:id]), response: 200
  end

  def destroy
    Venue.delete(params[:id])
    render nothing: true, status: 204
  end
end
