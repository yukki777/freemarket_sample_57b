class ProductsController < ApplicationController
  before_action :set_product,only: [:edit]

  def index
    @products = Product.all
  end

  def show
  end

  def update
    @user = User.find_by(id: params[:id]) 
    @product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
  end

  def product_edit
    @user = User.find_by(id: params[:id])
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to display_user_path(current_user), notice: '出品した商品を削除しました'
  end

  def search
    i = 132
    @category = Category.all
    @parents = @category.where(ancestry: nil)
    @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(i)
    
    @total_page =  Product.search(params[:search]).page(params[:page]).per(i).total_pages
    @first_page =  Product.search(params[:search]).page(params[:page]).per(i).first_page?
    @last_page =  Product.search(params[:search]).page(params[:page]).per(i).last_page?

  end
  
# スプリントレビュー後削除、ここから
  def confirmation
  end
# ここまで

  private
  def set_product
    @product = Product.find(params[:id])
  end

end
