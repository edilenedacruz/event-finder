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

  def create
    render json: Venue.create(venue_params), status: 201
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :url, :latitude, :longitude)
  end
end
