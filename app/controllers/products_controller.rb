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
    @products = Product.search(params[:search])
  end

  
# スプリントレビュー後削除、ここから
  def confirmation
  end
# ここまで
end
