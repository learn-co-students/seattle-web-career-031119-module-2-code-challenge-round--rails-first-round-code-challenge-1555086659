Rails.application.routes.draw do
  get '/heroines/search', to: 'heroines#search'
  resources :powers
  resources :heroines
end
