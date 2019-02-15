Rails.application.routes.draw do
  get 'galaxy_vacansies/search'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :expeditions do
    get 'react', on: :collection
  end
  resources :planets
  resources :spaceships do
    get 'react', on: :collection
  end
  resources :galaxies
  resources :itinerary_entries
  resources :itineraries
  get 'chats/index', to: 'chats#index'
  post 'chats/new_message', to: 'chats#new_message'

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
