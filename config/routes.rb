Rails.application.routes.draw do
  
  resources :channels
  resources :users
  resources :messages
  root "rooms#index"
  resources :rooms do
    resources :channels do
      resources :messages
    end
  end

  #START OF CUSTOM ROUTING
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
