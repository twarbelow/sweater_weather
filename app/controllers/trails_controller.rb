class TrailsController < ApplicationController
  def index
    geo = GeoFacade.get_coords(params[:location])
    trails = TrailsFacade.get_trails(geo.lat, geo.long, params[:location])
    forecast = ForecastFacade.get_forecast(geo.lat, geo.long)
    render json: {
      "data": {
        "id": "null",
        "type": "trail",
        "attributes": {
          "location": params[:location],
          "forecast": forecast,
          "trails": trails
        }
      }
    }
  end
end
