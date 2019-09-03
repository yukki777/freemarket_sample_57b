Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:new, :index, :create] do
    collection do
      post 'confirmation'
    end
  end
  get 'products/confirmation' => 'products#confirmation'
end
