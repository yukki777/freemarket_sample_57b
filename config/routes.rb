Rails.application.routes.draw do

  devise_for :users 
    
  root to: 'products#index'
  
  resources :signup do
    collection do
      get 'new1'
      get 'new2'
      get 'new3'
      get 'new4' 
      get 'new5'
      get 'complete' 
    end
  end
  
  resources :users, only: [:edit, :update, :show]
  resources :productss, only: [:edit, :update, :show]

end
