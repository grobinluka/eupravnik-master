Rails.application.routes.draw do
  resources :discussions
  devise_for :users

  root 'discussions#index'
  
end
