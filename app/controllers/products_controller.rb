class ProductsController < ApplicationController

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
    @product = Product.find(params[:id])
    @products = Product.all
    @product.destroy
    redirect_to users_display_path, notice: '出品した商品を削除しました'
  end

  def search
    i = 1
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



end
