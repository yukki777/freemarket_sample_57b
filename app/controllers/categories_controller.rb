class CategoriesController < ApplicationController

  def show
    @products = Product.all
    @category = Category.find(params[:id])
  end
  
end
