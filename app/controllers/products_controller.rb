class ProductsController < ApplicationController
  require 'payjp'
  before_action :ddmenu
  before_action :set_card, only: [:confirmation, :pay]
  before_action :get_payjp_info, only: [:confirmation, :pay]
  before_action :set_product, [:pay, :destroy]


  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @childs = @category.where(ancestry: "1")
    @grandchilds = @category.where(ancestry: "1/2")
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
    @products = Product.all
    @product.destroy
    redirect_to users_display_path, notice: '出品した商品を削除しました'
  end

  def search
    i = 132
    @categories = Category.all
    @parents = @category.where(ancestry: nil)
    @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(i)
    
    @total_page =  Product.search(params[:search]).page(params[:page]).per(i).total_pages
    @first_page =  Product.search(params[:search]).page(params[:page]).per(i).first_page?
    @last_page =  Product.search(params[:search]).page(params[:page]).per(i).last_page?

  end
  
# スプリントレビュー後削除、ここから
  def confirmation
    # @product = Product.find(params[:id])
    wallet = current_user.wallet
    if wallet.present?
      customer = Payjp::Customer.retrieve(wallet.customer_id)
      @default_card_information = customer.cards.retrieve(wallet.card_id)
    end
  end

  def finish
  end

  def pay
    charge = Payjp::Charge.create(
    amount: @product.price,
    customer: @wallet.customer_id,
    currency: 'jpy',
    )
    redirect_to finish_products_path
  end


  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def ddmenu
    @categories = Category.all
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

  def set_product
    @products = Product.find(params[:id])
  end


end
