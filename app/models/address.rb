class Address < ApplicationRecord
  belongs_to :user, optional: true
  has_one :product

  validates :postal_code, :city, :address, :prefecture_id, presence: true
  
  # active_hashで都道府県データを導入する
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
end

