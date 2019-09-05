class ProductsController < ApplicationController
  require 'payjp'

  def index
  end

  def show
  end

  def new
  end

  def confirmation
    @product = Product.find(params[:id])
  end

  def pay
    Payjp::api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

end