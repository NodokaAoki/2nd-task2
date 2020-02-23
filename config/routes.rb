Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followers' => 'relationships#followers'
    get 'follows' => 'relationships#follows'
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  root to: 'home#top'
  get 'home/about' => 'home#about'

end
