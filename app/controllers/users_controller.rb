class UsersController < ApplicationController
  before_action :set_user
  before_action :set_product, only: [:show, :edit]
  before_action :set_image
  
  def index
  end

  def show
    @users= User.find(params[:id])

  end

  def edit
    @users = User.all
  end

  def display
    @products = Product.where(id: current_user.id)
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
 
  def set_image
    @images = Image.where(product_id:params[:id])
  end
end
