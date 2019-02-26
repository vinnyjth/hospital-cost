Rails.application.routes.draw do
  namespace :admin do
      resources :hospitals, only: %i(index show new create edit update destroy)
      resources :hospital_line_items, only: %i(index show new create edit update destroy)
      resources :line_items, only: %i(index show new create edit update destroy)
      resources :scrapers, only: %i(index show new create edit update destroy)

      root to: "hospitals#index"
    end
  resources :scrapers
  resources :hospital_line_items
  resources :line_items
  resources :hospitals
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
