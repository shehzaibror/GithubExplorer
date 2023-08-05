# config/routes.rb
Rails.application.routes.draw do
  root 'home#index'
  get 'show', to: 'home#show'
end
