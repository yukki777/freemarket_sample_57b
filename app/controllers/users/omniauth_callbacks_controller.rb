# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def facebook
    callback_for(:facebook)
  end

  # callback for twitter
  def twitter
    callback_for(:twitter)
  end

  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def callback_for(provider)
    # binding.pry
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # binding.pry
    if @user.persisted?
      # Active Record object がDB に保存済みかどうかを判定するメソッド です。
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
      binding.pry
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
      binding.pry
    end
  end

  def failure
    redirect_to root_path
  end

  # def facebook
  #   callback_from :facebook
  # end

  # def google_oauth2
  #   callback_from :google
  # end

  # private

  # def callback_from(provider)
  #   provider = provider.to_s
  #   # => "google"
  #   @user = User.from_omniauth(request.env['omniauth.auth'])
  #   #<User id: nil, email: "111244028373611352764-google_oauth2@example.com", nickname: "大野幸男", first_name: nil, first_name_kana: nil, family_name: nil, family_name_kana: nil, birthday: nil, phone_number: nil, created_at: nil, updated_at: nil, provider: "google_oauth2", uid: "111244028373611352764">

  #   if @user.persisted?
  #     flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session[:nickname] = @user.nickname
  #     session[:email] = @user.email
  #     session[:password] = @user.password
  #     session[:provider] = @user.provider
  #     session[:uid] = @user.uid
  #     binding.pry
  #     redirect_to new_user_registration_sns_path
  #   end
  # end

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
