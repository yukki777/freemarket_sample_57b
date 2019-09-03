class Address < ApplicationRecord
  has_one :product
  belongs_to :user, optional: true

  validates :postal_code, :city, :address, :prefecture_id, presence: true

  class Address < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
  end
end
