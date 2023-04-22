Rails.application.routes.draw do
  resources :video_rooms
  root "rooms#index"
  
  resources :channels
  resources :users
  resources :messages
  resources :rooms do
    resources :channels do
      resources :messages
    end
  end

  #START OF CUSTOM ROUTING
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/clock_in', to: 'logs#clock_in'
  get '/clock_out', to: 'logs#clock_out'
  post '/contact', to: 'logs#create'
  get '/inactive', to: 'logs#inactive'

end
