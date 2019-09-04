class ProductsController < ApplicationController
  require 'payjp'

  def index
  end

  def show
  end

  def new
  end

# スプリントレビュー後削除、ここから
  def confirmation
  end
# ここまで

  def pay
    Payjp::api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end
end
