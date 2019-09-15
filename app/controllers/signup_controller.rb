class SignupController < ApplicationController
require 'payjp'

before_action :validates_new1, only: :new2
#before_action :validates_new4, only: :new5
# payjpのapiキーをアクションが実行される前に有功化させる
before_action :get_payjp_info, only: :create

before_action :validates_new2, only: :new3
before_action :validates_new3, only: :new4
before_action :validates_new4, only: :new5
def new1
  @user = User.new
end

def new2
  session[:nickname] = user_params[:nickname]
  session[:email] = user_params[:email]
  session[:password] = user_params[:password]
  session[:password_confirmation] = user_params[:password_confirmation]
  session[:family_name] = user_params[:family_name]
  session[:first_name] = user_params[:first_name]
  session[:family_name_kana] = user_params[:family_name_kana]
  session[:first_name_kana] = user_params[:first_name_kana]
  session[:birthday] = user_params[:birthday]
  @user = User.new
end

def new3
  
  session[:phone_number] = user_params[:phone_number]
  @user = User.new
end

def new4
  @user = User.new
  @user.build_address
end

def new5
  @user = User.new
  # @user.build_wallet
  session[:address_attributes] = user_params[:address_attributes]
end

def complete
  sign_in User.find(session[:user_id]) unless user_signed_in?
end

def create
  # session[:wallet_attributes] = user_params[:wallet_attributes] #こっからチェック！

  @user = User.new(
    nickname: session[:nickname], 
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name], 
    first_name: session[:first_name], 
    family_name_kana: session[:family_name_kana], 
    first_name_kana: session[:first_name_kana], 
    birthday: session[:birthday],
    phone_number: session[:phone_number],
    address_attributes: session[:address_attributes],
    # wallet_attributes: session[:wallet_attributes]
    uid: session[:uid],
    provider: session[:provider]
  )    
    if @user.save
      session[:user_id] = @user.id
      customer = Payjp::Customer.create(     
        email: @user.email,
        card: params["payjp-token"],
        metadata: {user_id: @user.id}
      )
      @wallet = Wallet.create(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
      redirect_to complete_signup_index_path
    else
      render new1_signup_index_path
    end
    
end

def validates_new1
  session[:nickname] = user_params[:nickname]
  session[:email] = user_params[:email]
  session[:password] = user_params[:password]
  session[:password_confirmation] = user_params[:password_confirmation]
  session[:family_name] = user_params[:family_name]
  session[:first_name] = user_params[:first_name]
  session[:family_name_kana] = user_params[:family_name_kana]
  session[:first_name_kana] = user_params[:first_name_kana]

  @user = User.new(
    nickname: session[:nickname], 
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name], 
    first_name: session[:first_name], 
    family_name_kana: session[:family_name_kana], 
    first_name_kana: session[:first_name_kana], 
  )
  render '/signup/new1' unless @user.valid?
end

def validates_new2
  session[:phone_number] = user_params[:phone_number]
  @user = User.new(
    nickname: session[:nickname], 
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name], 
    first_name: session[:first_name], 
    family_name_kana: session[:family_name_kana], 
    first_name_kana: session[:first_name_kana], 
    birthday: session[:birthday],
    phone_number: session[:phone_number],
  )
  render '/signup/new2' unless @user.valid?
 
end

def validates_new3
  @user = User.new(
    nickname: session[:nickname], 
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name], 
    first_name: session[:first_name], 
    family_name_kana: session[:family_name_kana], 
    first_name_kana: session[:first_name_kana], 
    birthday: session[:birthday],
    phone_number: session[:phone_number],
  )
  render '/signup/new3' unless @user.valid?
 
end

def validates_new4
  session[:address_attributes] = user_params[:address_attributes]
  @user = User.new(
    nickname: session[:nickname], 
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name], 
    first_name: session[:first_name], 
    family_name_kana: session[:family_name_kana], 
    first_name_kana: session[:first_name_kana], 
    birthday: session[:birthday],
    phone_number: session[:phone_number],
    address_attributes: session[:address_attributes]
  )
  render '/signup/new4' unless @user.valid?
 
end

private

def user_params
  params.require(:user).permit(
    :nickname, 
    :email, 
    :password, 
    :password_confirmation, 
    :family_name, 
    :first_name, 
    :family_name_kana, 
    :first_name_kana, 
    :birthday,
    :phone_number,
    address_attributes:[:id,:postal_code,:city,:address,:building_name,:building_phone_number,:prefecture_id],
    # wallet_attributes:[:card_id, :customer_id]
  )
  end
end

def get_payjp_info
  Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
end
