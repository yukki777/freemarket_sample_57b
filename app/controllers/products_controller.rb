class ProductsController < ApplicationController

  def index
  end

  def new
  end

  def confirmation
  end

  def pay
    Payjp::api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end

end
