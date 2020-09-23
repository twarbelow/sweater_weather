class TrailsController < ApplicationController
  def index
    geo = GeoFacade.get_coords(params[:location])
    trails = TrailsFacade.get_trails(geo.lat, geo.long)
      # array of trail poros
  end
end
