Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :expeditions
  resources :planets
  resources :spaceships
  resources :galaxies
  resources :itinerary_entries
  resources :itineraries

  root "expeditions#index"

  scope module: 'api' do
    namespace 'v1' do
      resources :expeditions, only: %I[show index create]
    end
    namespace 'v2' do
      resources :spaceships, only: %I[show index create]
      resources :expeditions
      devise_for :users
    end
  end
end
