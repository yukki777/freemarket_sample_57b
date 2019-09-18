require 'rails_helper'
describe Wallet do
  describe '#create' do
    it "is invalid without card_id" do
      wallet = Wallet.new(user_id: current_user.id, card_id: '', customer_id: customer.id)
      wallet.valid?
      expect(wallet.errors[:card_id]).to include("can't be blank")
    end
  end
end