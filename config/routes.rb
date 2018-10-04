Rails.application.routes.draw do
  resources :drivers

    # /passengers/:passenger_id/trips/create
  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips

  patch '/drivers/:id/change_status', to: 'drivers#change_status', as: 'remove_driver'

  patch '/passengers/:id/change_status', to: 'passengers#change_status', as: 'remove_passenger'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
