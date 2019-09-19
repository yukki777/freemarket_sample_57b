require 'rails_helper'

describe WalletController, type: :controller do

  describe 'GET #new' do

    it "renders the :new template" do
      user = create(:user)
      get :new, params: { user_id: user.id }
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do

    it "renders the :index template" do
      user = create(:user)
      login_user user
      get :index, params: { user_id: user.id }
      expect(response).to render_template :index
    end
  end
end