class TrailsController < ApplicationController
  def index
    geo = GeoFacade.get_coords(params[:location])
    trails = TrailsFacade.get_trails(geo.lat, geo.long, params[:location])
    render json: trails
      # array of trail poros
  end
end
