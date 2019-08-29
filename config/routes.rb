Rails.application.routes.draw do
  root 'products#index'
  get 'new' => 'products#new'
end
