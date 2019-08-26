class Address < ApplicationRecord
  has_one: product

  validates :postal_code, :city, :address, :prefecture, presence: true
end
