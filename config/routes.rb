Rails.application.routes.draw do
  root to:'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
   resources :comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
      member do
          get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
  end
  
  resources :genres, only:[:new, :create, :index, :edit, :update]
  resources :items, only:[:new, :create, :index, :show, :edit, :update, :destroy]
end
