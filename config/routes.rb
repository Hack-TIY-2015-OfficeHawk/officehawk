Rails.application.routes.draw do
  #I hate these and want to write them out by hand
  resources :organizations
  resources :alerts
  resources :employees
end
