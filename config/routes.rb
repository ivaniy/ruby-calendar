Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :events do
    member do
      patch :accept
      patch :maybe
      patch :decline
    end
  end
end
