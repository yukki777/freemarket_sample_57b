require 'rails_helper'
describe Wallet do
  describe '#create' do
    before do
      user = create(:user)
    end

    it "is valid with all" do
      wallet = create(:wallet)
      expect(wallet).to be_valid
    end

    it "is invalid without user_id" do
      wallet = build(:wallet, user_id: nil)
      wallet.valid?
      expect(wallet.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid without customer_id" do
      wallet = build(:wallet, customer_id: nil)
      wallet.valid?
      expect(wallet.errors[:customer_id]).to include("を入力してください")
    end

    it "is invalid without card_id" do
      wallet = build(:wallet, card_id: nil)
      wallet.valid?
      expect(wallet.errors[:card_id]).to include("を入力してください")
    end
  end
end