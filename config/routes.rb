Rails.application.routes.draw do
  root to: "main#index"

  resources :shippings
  resources :solicitudes

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :shippings, only: [:index]
      resources :solicitudes, only: [:create, :index]
    end
  end
  
end
