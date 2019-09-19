class WalletController < ApplicationController
  require 'payjp'
  before_action :set_card, except: :new
  before_action :set_user
  before_action :get_payjp_info, only: [:new, :create, :destroy, :show, :index]

  # カード情報があれば表示して、なければ追加するボタン
  def index
    wallet = current_user.wallet
    if wallet.present?
      customer = Payjp::Customer.retrieve(wallet.customer_id)
      @default_card_information = customer.cards.retrieve(wallet.card_id)
    end
  end

  def new
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"

     # なければトークンの作成
    else
      customer = Payjp::Customer.create(     
        email: current_user.email,
        card: params["payjp-token"],
        metadata: {user_id: current_user.id}
      )
      @wallet = Wallet.create(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)     
      redirect_to action: 'index'
    end
  end

  def destroy
    wallet = @user.wallet # current_userのカードの1番目の要素を取得
    if wallet.present?  # カード情報あれば削除
      customer = Payjp::Customer.retrieve(wallet.customer_id) # payjpでcustomerの情報を取得
      customer.delete
      wallet.delete
    end
      redirect_to action: "index", id: current_user.id
  end

  private

  def get_payjp_info
    # credentials.yml使うときコメントアウト外す
    # if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # else
    #   Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    # end
  end

  # ユーザーのカード情報をセット
  def set_card
    @wallet = Wallet.where(user_id: current_user.id).first if Wallet.where(user_id: current_user.id).present?
  end

  # ユーザーをセット
  def set_user
    @user = User.find(params[:user_id])
  end
end
