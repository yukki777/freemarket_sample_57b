Rails.application.routes.draw do
  devise_for :users
  get 'products/top'
  get 'products/show'
  get 'products/new'
  get 'products/confirmation'

  get 'users/logout'
  get 'users/mypage'
  get 'users/details'
  get 'users/telephone'
  get 'users/telephonesecond'
  get 'users/address'
  get 'users/payment'
  get 'users/finish'
  get 'users/sociallink'
  get 'users/show'
  get 'users/edit'
  get 'users/registration'

end
