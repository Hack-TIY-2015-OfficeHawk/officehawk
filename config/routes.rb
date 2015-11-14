Rails.application.routes.draw do
  #I hate these and want to write them out by hand
  resources :organizations, only: [ :index, :create, :update, :destroy ]
  resources :alerts
  resources :employees, only: [ :index, :create, :update, :destroy ]
end
