# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    # @user = User.new
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # trueの時点でSNSのアカウントを持っていることが確定
      # Active Record object がDB に保存済みかどうかを判定するメソッド です。
      sign_in_and_redirect @user, event: :authentication 
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?

  # def set_flash_message(key, kind, options = {})
  #   message = find_message(kind, options)
  #   if options[:now]
  #     flash.now[key] = message if message.present?
  #   else
  #     flash[key] = message if message.present?
  #   end
  
    else
      # unless @user.uid.blank?

      session[:uid] = @user.uid
      session[:email] = @user.email
      session[:provider] = @user.provider
      session[:nickname] = @user.nickname
      session[:first_name] = @user.first_name
      session[:family_name] = @user.family_name
      session[:password] = @user.password
      # session[:password_confirmation] = @user.encrypted_password

      # session[:encrypted_password] = @user.encrypted_password


      # redirect_to new_user_registration_path
      redirect_to new1_signup_index_path
      # else
      #   new_user_session_path
      # end


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
