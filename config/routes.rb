Rails.application.routes.draw do
  root 'users#calendar'
  devise_for :users
  resources :users, only: [:index, :show, :calendar]
end
