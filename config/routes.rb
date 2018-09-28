Rails.application.routes.draw do
  resources :reservations
  root to: "reservations#index"
end
