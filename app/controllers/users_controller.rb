class UsersController < ApplicationController

  def index
    redirect_to :action => 'details'
    redirect_to :action => 'telephone'
    redirect_to :action => 'telephonesecond'
    redirect_to :action => 'address'
    redirect_to :action => 'payment'
    redirect_to :action => 'finish'
    redirect_to :action => 'sociallink'
    redirect_to :action => 'registration'
    redirect_to :action => 'mypage'
    redirect_to :action => 'logout'
  end

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

  def show
  end

  def edit
  end
end
