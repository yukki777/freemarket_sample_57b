Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # 404 Not Found
  root 'products#index'
  # binding.pry 
  resources :products, only: :new
end
