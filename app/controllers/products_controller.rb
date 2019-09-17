class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @product.images.build
    @category_parent = Category.all.where(ancestry: nil)
    @category_children = Category.all.where(ancestry: '1')
    @category_gchildren = Category.all.where(ancestry: '1/2')
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        params[:images][:image].each do |image|
          @product.images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        @product.images.build
        format.html{render :new}
      end
    end
  end

  def edit
  end
# スプリントレビュー後削除、ここから
  def confirmation
  end
# ここまで

  private
  def product_params
    params.require(:product).permit(
      :name,
      :price,
      :description,
      :brand_id,
      :postage_id,
      :shipping_method_id,
      :size_id,
      :shipping_date_id,
      :condition_id,
      :prefecture_id,
      :category_id,
      images_attributes: {images: []}
      )
      .merge(user_id: current_user.id)
  end
end
