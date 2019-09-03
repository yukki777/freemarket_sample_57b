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
  resources :products, only: [:edit, :update, :show]
  
  get 'products/show' =>'products#show'
  get 'products/new' =>'products#new'
  get 'products/confirmation' =>'products#confirmation'

  get 'users/logout' =>'users#logout'
  get 'users/mypage' =>'users#mypage'
  get 'users/details' =>'users#details'
  get 'users/telephone' =>'users#telephone'
  get 'users/telephonesecond' =>'users#telephonesecond'
  get 'users/address' =>'users#address'
  get 'users/payment' =>'users#payment'
  get 'users/finish' =>'users#finish'
  get 'users/sociallink' =>'users#sociallink'
  get 'users/show' =>'users#show'
  get 'users/edit' =>'users#edit'
  get 'users/registration' =>'users#registration'

end
