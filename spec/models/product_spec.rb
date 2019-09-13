require 'rails_helper'

describe Product do
  describe '#create' do
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      product = build(:product, user_id: nil)
      product.valid?
      expect(product.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid without a address_id" do
      product = build(:product, address_id: nil)
      product.valid?
      expect(product.errors[:address_id]).to include("を入力してください")
    end

    it "is invalid without a brand_id" do
      product = build(:product, brand_id: nil)
      product.valid?
      expect(product.errors[:brand_id]).to include("を入力してください")
    end

    it "is invalid without a postage_id" do
      product = build(:product, postage_id: nil)
      product.valid?
      expect(product.errors[:postage_id]).to include("を入力してください")
    end

    it "is invalid without a shipping_method_id" do
      product = build(:product, shipping_method_id: nil)
      product.valid?
      expect(product.errors[:shipping_method_id]).to include("を入力してください")
    end

    it "is invalid without a size_id" do
      product = build(:product, size_id: nil)
      product.valid?
      expect(product.errors[:size_id]).to include("を入力してください")
    end

    it "is invalid without a shipping_date_id" do
      product = build(:product, shipping_date_id: nil)
      product.valid?
      expect(product.errors[:shipping_date_id]).to include("を入力してください")
    end

    it "is invalid without a condition_id" do
      product = build(:product, condition_id: nil)
      product.valid?
      expect(product.errors[:condition_id]).to include("を入力してください")
    end
  end
end
