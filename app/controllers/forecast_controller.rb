class ForecastController < ApplicationController
  def show
    geo = GeoFacade.get_coords(params[:location])
    weather = WeatherFacade.get_weather(geo.lat, geo.long)
    render json: weather
  end
end
