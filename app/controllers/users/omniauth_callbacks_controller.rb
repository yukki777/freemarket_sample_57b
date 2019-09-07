# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    provider = provider.to_sym
    
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # @user = User.new
    # ↑SNSアカウントを持っていない場合の検証用
    if @user.persisted?
      # Active Record object がDB に保存済みかどうかを判定するメソッド です。
      sign_in_and_redirect @user, event: :authentication 
    else
      unless @user.provider.blank?
      session[:uid] = @user.uid
      session[:email] = @user.email
      session[:provider] = @user.provider
      session[:nickname] = @user.nickname
      session[:password] = @user.password
      session[:first_name] = @user.first_name
      session[:family_name] = @user.family_name
      # redirect_to new_user_registration_path
      redirect_to new1_signup_index_path
      else
        session[:value] = provider
        redirect_to new_user_session_path, notice: "#{provider}での登録情報はありません。他の方法でログインをお試しください。"
      end
    end
  end

  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
