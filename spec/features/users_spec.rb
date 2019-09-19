require "rails_helper"

feature "UserFeature" do

  feature "facebook連携でサインアップする" do

    background do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      visit user_facebook_omniauth_authorize_path
    
      # click_link "ログイン"
    
    end

    scenario  "サインアップするとユーザーが増える" do
      expect{
        click_on 'facebookで登録する'
      }.to change(User, :count).by(1)
    end

    scenario  "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
      click_on "Facebookでログイン"
      # click_link "ログアウト"
      # click_link "ログイン"
      expect{
        click_on "facebookで登録する"
      }.not_to change(User, :count)
    end

  end
end