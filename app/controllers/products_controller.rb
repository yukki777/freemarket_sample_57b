class ProductsController < ApplicationController
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

  def search
    @category = Category.all
    @parents = @category.where(ancestry: nil)
    # @products = Product.order("created_at DESC").page(params[:page]).per(3)
    @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(3)

  
# スプリントレビュー後削除、ここから
  def confirmation
  end
# ここまで

  private

  def ddmenu
    @category = Category.all
    @parents = @category.where(ancestry: nil)
  end

end
