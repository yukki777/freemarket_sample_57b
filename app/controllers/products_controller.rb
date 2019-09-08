class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
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
