class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  require 'payjp'
  before_action :ddmenu
  before_action :set_card, only: [:confirmation, :pay]
  before_action :get_payjp_info, only: [:confirmation, :pay]
  before_action :set_product,only: [:pay, :destroy, :edit, :product_edit, :update, :confirmation]
  before_action :set_user,only: [:update, :edit, :product_edit]
  def index
    @products = Product.all
  end

  def show
    @products= Product.find(params[:id])
    @images = Image.where(product_id:params[:id])
  end

  def update
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
    @products= Product.find(params[:id])
    @images = Image.where(product_id:params[:id])
  end

  def product_edit
  end

  def destroy
    @products.destroy
    redirect_to display_user_path(current_user), notice: '出品した商品を削除しました'
  end

  def search
    i = 132
    @categories = Category.all
    @parents = @categories.where(ancestry: nil)
    @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(i)

    @total_page =  Product.search(params[:search]).page(params[:page]).per(i).total_pages
    @first_page =  Product.search(params[:search]).page(params[:page]).per(i).first_page?
    @last_page =  Product.search(params[:search]).page(params[:page]).per(i).last_page?

  end
  
  def confirmation
    wallet = current_user.wallet
    if wallet.present?
      customer = Payjp::Customer.retrieve(wallet.customer_id)
      @default_card_information = customer.cards.retrieve(wallet.card_id)
    end
  end

  def finish
  end

  def pay
    charge = Payjp::Charge.create(
    amount: @products.price,
    customer: @wallet.customer_id,
    currency: 'jpy',
    )
    redirect_to finish_products_path
  end

  private
  def ddmenu
    @categories = Category.all
    @parents = @categories.where(ancestry: nil)
  end

  def set_card
    @wallet = Wallet.where(user_id: current_user.id).first if Wallet.where(user_id: current_user.id).present?
  end

  def product_params
    params.require(:product).permit(
      :name,
      :price,
      :description,
      :category_id,
      :brand_id,
      :postage_id,
      :shipping_method_id,
      :size_id,
      :shipping_date_id,
      :condition_id,
      :prefecture_id,
      images_attributes: {images: []}
      )
      .merge(user_id: current_user.id)
  end

  def get_payjp_info
    # credentials.yml使うときコメントアウト外す
    # if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # else
    #   Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    # end
  end

  def set_product
    @products = Product.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
