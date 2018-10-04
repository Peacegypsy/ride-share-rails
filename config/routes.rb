Rails.application.routes.draw do
  resources :drivers

    # /passengers/:passenger_id/trips/create
  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips

  patch '/drivers/:id/take_offline', to: 'drivers#take_offline', as: 'remove_driver'

  patch '/passengers/:id/take_offline', to: 'passengers#take_offline', as: 'remove_passenger'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
