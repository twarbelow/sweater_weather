class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :forecast
  attributes :current, :daily, :hourly
end
