class ProductsController < ApplicationController
  def index
    @category = Category.all
    @parents = @category.where(ancestry: nil)
    @products = Product.all
  end
  def show
  end

  def new
  end

  def edit
  end

  def search
    @category = Category.all
    @parents = @category.where(ancestry: nil)
    # @products = Product.order("created_at DESC").page(params[:page]).per(3)
    @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(3)
  end

  
# スプリントレビュー後削除、ここから
  def confirmation
  end
# ここまで
end
