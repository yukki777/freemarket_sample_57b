class UsersController < ApplicationController
  before_action :set_user
  before_action :set_product, only: [:show, :edit, :display]

  
  def index
  end

  def show
  end

  def edit
    @users = User.all
  end

  def display
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

  def set_product
    @products = Product.all
  end
 
end
