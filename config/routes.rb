Rails.application.routes.draw do

  resources :images
  resources :apartment_buildings
  get 'users/show'

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  
  resources :users
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
  
  
end
