Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "home#index" 
  resources :users, only:[:show, :edit, :update]
  resources :diaries
  resources :communities do
    resources :community_participants, only: [:index, :update]
  end
  resources :chats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end