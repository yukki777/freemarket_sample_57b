class UsersController < ApplicationController
  before_action :set_user

  
  def index
  end

  def show
   
  end

  def edit
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
