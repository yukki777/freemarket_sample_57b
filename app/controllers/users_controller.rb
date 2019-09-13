class UsersController < ApplicationController
  before_action :set_user

  
  def index
  end

  def show
    @user = User.find(params[:id])
    @products = Product.all
  end

  def edit
    @users = User.all
    @products = Product.all
  end

  def display
    @user = User.find(params[:id])
    @products = Product.all
    
  end
# スプリントレビュー後削除、ここから
  def logout
  end

  def mypage
  end

  def details
  end

  def telephone
  end

  def telephonesecond
  end

  def address
  end

  def payment
  end

  def finish
  end

  def sociallink
  end

  def registration
  end
  # ここまで
  private

  def set_user
    @user = User.find(params[:id])
  end
 
  
end
