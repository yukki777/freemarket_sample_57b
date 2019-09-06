class ProductsController < ApplicationController
  def index
    @category = Category.all
    @parents = @category.where(ancestry: nil)
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
