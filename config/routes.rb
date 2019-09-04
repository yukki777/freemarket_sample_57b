Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:new, :index, :create] do
    collection do
      post 'confirmation/:id' => 'products#pay', as: 'pay'
    end
  end
  get 'products/confirmation' => 'products#confirmation'
end
