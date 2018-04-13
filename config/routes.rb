Rails.application.routes.draw do
  
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  
  
  resources :channels
  resources :discussions do
    resources :replies
  end
  
  resources :discussions do
    member { post :vote }
  end
  
  resources :replies do
    member { post :vote }
  end
  
  
  
  
  root 'discussions#index'
  
  
  get 'home/profile', to: 'home#profile'
  get 'users/home/profile', to: 'home#profile'
  get 'discussions/home/profile', to: 'home#profile'
  get 'discussions/:id/replies/:id/home/profile', to: 'home#profile'
  get 'channels/:id/home/profile', to: 'home#profile'
  get 'channels/home/profile', to: 'home#profile'
end
