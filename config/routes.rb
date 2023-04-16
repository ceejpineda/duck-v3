Rails.application.routes.draw do
  
  resources :channels
  resources :messages
  root "rooms#index"
  resources :rooms do
    resources :channels do
      resources :messages
    end
  end
end
