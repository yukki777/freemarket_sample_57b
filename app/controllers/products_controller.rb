class ProductsController < ApplicationController
  def index
    redirect_to :action => 'top'
    redirect_to :action => 'confirmation'
  end

  def top
  end
  
  def confirmation
  end

  def show
  end

  def new
  end

end
