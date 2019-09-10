class UsersController < ApplicationController
  before_action :ddmenu

  
  def index
  end

  def show
   
  end

  def edit
    @users = User.all
    @products = Product.all
  end

  def display
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

  def ddmenu
    @category = Category.all
    @parents = @category.where(ancestry: nil)
  end
end
