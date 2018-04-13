Rails.application.routes.draw do
  
  resources :channels
  resources :discussions do
    resources :reply
  end
  
  
  root 'discussions#index'
  
  devise_for :users
  
end
