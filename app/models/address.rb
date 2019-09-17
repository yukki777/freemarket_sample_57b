class Address < ApplicationRecord

  has_one :product
  belongs_to :user, optional: true

  validates :postal_code, :city, :address, :prefecture_id, presence: true
  
  # active_hashで都道府県データを導入する
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
end

