require 'rails_helper'
describe Users::OmniauthCallbacksController, type: :controller do
  before do
    stub_env_for_omniauth
  end

  describe "GET #facebook" do
    context "as a guest user" do
      before { get :facebook }
      it { should redirect_to my_edit_user_registration_path }
    end
  end


  def stub_env_for_omniauth(uid="1234567890")
    # devise を使っている場合
    @request.env["devise.mapping"] = Devise.mappings[:user]

    request.env["omniauth.auth"] = OmniAuth::AuthHash.new({
      "provider"=>"facebook",
      "uid"=>uid,
      ...
    })
  end
end