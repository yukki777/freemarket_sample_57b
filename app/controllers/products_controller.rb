class ProductsController < ApplicationController
  require 'payjp'
  before_action :ddmenu


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
# ここまで

  private

  def ddmenu
    @category = Category.all
    @parents = @category.where(ancestry: nil)
  end

end
