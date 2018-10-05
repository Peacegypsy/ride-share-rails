Rails.application.routes.draw do
 # root "static#show"
  resources :drivers

  # /passengers/:passenger_id/trips/create
  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips
  get "/:page" => "static#show"

  patch '/drivers/:id/take_offline', to: 'drivers#take_offline', as: 'remove_driver'

  patch '/passengers/:id/take_offline', to: 'passengers#take_offline', as: 'remove_passenger'

  get '/trip/:id/rate_trip', to: 'trips#rate_trip', as: 'complete_trip'
  patch '/trip/:id/rate_trip', to: 'trips#complete_trip'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
