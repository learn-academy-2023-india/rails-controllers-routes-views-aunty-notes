Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "game_night#landing"
  get '/landing', to: 'game_night#landing', as: 'landing'
  get '/game', to: 'game_night#game', as: 'game'
end
