class ProductsController < ApplicationController
  require 'payjp'
  before_action :ddmenu
  before_action :set_card, only: [:confirmation, :pay]
  before_action :get_payjp_info, only: [:confirmation, :pay]


  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
  end
   
  def edit
    @user = User.find_by(id: params[:id]) 
    @product = Product.find_by(id: params[:id])
  end

  def product_edit
    @product = Product.find_by(id: params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @products = Product.all
    @product.destroy
    redirect_to users_display_path, notice: '出品した商品を削除しました'
  end

  
# スプリントレビュー後削除、ここから
  def confirmation
    @product = Product.find(params[:id])
    wallet = current_user.wallet
    if wallet.present?
      customer = Payjp::Customer.retrieve(wallet.customer_id)
      @default_card_information = customer.cards.retrieve(wallet.card_id)
    end
  end

  def finish
  end

  def pay
    @product = Product.find(params[:id])
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :customer => @wallet.customer_id,
    :currency => 'jpy',
    )
    redirect_to finish_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def ddmenu
    @category = Category.all
    @parents = @category.where(ancestry: nil)
  end

  def set_card
    @wallet = Wallet.where(user_id: current_user.id).first if Wallet.where(user_id: current_user.id).present?
  end

  def get_payjp_info
    # credentials.yml使うときコメントアウト外す
    # if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # else
    #   Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    # end
  end


end
