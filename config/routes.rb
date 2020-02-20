Rails.application.routes.draw do
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  devise_for :users
  root to: 'home#top'
  get 'home/about' => 'home#about'

end
