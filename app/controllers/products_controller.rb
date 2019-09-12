class ProductsController < ApplicationController
  def index
    @category = Category.all
    @parents = @category.where(ancestry: nil)
    @products = Product.all
  end
  def show
    # @products= Products.find(params[:id])
    @products= Product.find(1)
    @images = Image.where(product_id:1)
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
