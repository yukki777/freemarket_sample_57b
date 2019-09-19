require 'rails_helper'

describe WalletController, type: :controller do

  describe 'GET #new' do

    it "newアクションでnewページを表示する" do
      user = create(:user)
      get :new, params: { user_id: user.id }
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do

    it "indexアクションでindexページを表示する" do
      user = create(:user)
      login_user user
      get :index, params: { user_id: user.id }
      expect(response).to render_template :index
    end

    # it "assigns the requested default_card_information to @default_card_information" do
    #   user = create(:user)
    #   login_user user
    #   wallet = create(:wallet)
    #   get :index, params: { user_id: user.id }
    #   expect(assigns(:default_card_information)).to eq default_card_information
    # end

  end

  describe 'POST #create' do

    it "createアクションでクレカを登録する" do
      user = create(:user)
      login_user user
      wallet = create(:wallet)
      post :create, params: { user_id: user.id }
      expect{Wallet.create}.to change(Wallet, :count).by(1)
    end
  end


end