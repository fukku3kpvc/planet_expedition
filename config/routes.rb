Rails.application.routes.draw do
  devise_for :users
  resources :expeditions
  resources :planets
  resources :spaceships
  resources :galaxies
  resources :itinerary_entries
  resources :itineraries

  root "expeditions#index"
end
