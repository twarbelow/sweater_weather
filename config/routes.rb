Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/api/v1/forecast", to: 'forecast#show'

  get '/api/v1/trails', to: 'trails#index'
end
