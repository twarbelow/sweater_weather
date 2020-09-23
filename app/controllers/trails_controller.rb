class TrailsController < ApplicationController
  def index
    geo = GeoFacade.get_coords(params[:location])
    trails = TrailsFacade.get_trails(geo.lat, geo.long, params[:location])
    forecast = ForecastFacade.get_forecast(geo.lat, geo.long)
    response = ResponsePoro.new(params[:location], trails, forecast)
    render json: TrailsSerializer.new(response).serialized_json
  end
end
