class Product < ApplicationRecord
  has_many:   images
  belongs_to: address
  belongs_to: category
  belongs_to: user

  validates :name, :postage, :price, :description, :status, :shipping_date, presence: true
end
