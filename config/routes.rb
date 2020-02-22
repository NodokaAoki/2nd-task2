Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resources :favorites, only: [:create, :destroy]
  end
  root to: 'home#top'
  get 'home/about' => 'home#about'

end
