class ForecastController < ApplicationController
  def show
    geo = GeoFacade.get_coords(params[:location])
    weather = WeatherFacade.get_weather(g.coords)
    render json: weather
  end
end
