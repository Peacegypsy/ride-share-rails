Rails.application.routes.draw do
  resources :drivers
  resources :passengers
  resources :trips

  patch '/drivers/:id/change_status', to: 'drivers#change_status', as: 'remove_driver'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
