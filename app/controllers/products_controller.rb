class ProductsController < ApplicationController
  def index
    @category = Category.all
    @parents = @category.where(ancestry: nil)
    @products = Product.all
  end
  def show
    @products= Product.find(params[:id])
    @images = Image.where(product_id:params[:id])
  end

  def new
  end

  def edit
  end
# スプリントレビュー後削除、ここから
  def confirmation
  end
# ここまで
end
