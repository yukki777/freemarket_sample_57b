Rails.application.routes.draw do
  devise_for :users,
  controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks'
   }
    
  root 'products#index'
  
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

  # スプリントレビュー後削除、ここから
  get 'products/edit' =>'products#edit'
  
  get 'users/mypage' =>'users#mypage'
  get 'users/telephone' =>'users#telephone'
  get 'users/telephonesecond' =>'users#telephonesecond'
  get 'users/address' =>'users#address'
  get 'users/payment' =>'users#payment'
  get 'users/finish' =>'users#finish'
  get 'users/sociallink' =>'users#sociallink'
  get 'users/registration' =>'users#registration'
 # ここまで
 
  resources :categories 
  resources :users, only: [:edit, :update, :show]  do
    member do
      get 'display' => 'users#display' ,as: 'display'
      get 'logout'  => 'users#logout', as: 'logout'
      get 'transaction' =>'users#transaction', as: 'transaction'
      get 'sell'    =>'users#sell', as: 'sell'
      get 'profile' =>'users#profile', as: 'profile'
    end


    resources :wallet, only: [:new, :create, :destroy, :index]

    resources :products, only: [:edit, :new, :destroy,:update] do
      member do
        get 'product_edit' =>'products#product_edit',as: 'product_edit'
      end
    end
  end

  resources :users, only: [:edit, :update, :show]
  resources :products, only: [:edit, :show, :new,:destroy, :index] do
    collection do
      get 'finish' => 'products#finish'
      get 'search'
    end
    member do
      post 'confirmation' => 'products#pay', as: 'pay'
      get 'confirmation' => 'products#confirmation'
      get 'product_edit' =>'products#product_edit',as: 'product_edit'
    end
  end

  resources :products do
    resources :images, only: [:index, :new, :create, :delete,:update]
  end
end
# ルーティング調整中のため一時コメント化
# resources :users, only: [:edit, :update, :show]
#   resources :products, only: [:edit, :update, :show, :new,:destroy] do
#     collection do
#       get 'search'
#     end
#   end
# end
