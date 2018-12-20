Rails.application.routes.draw do
  resources :expeditions
  resources :planets
  resources :spaceships

  root "expeditions#index"
end
