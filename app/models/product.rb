class Product < ApplicationRecord
  has_many   :images, dependent: :destroy
  has_many   :product_categories
  has_many   :categories, through: :product_categories
  belongs_to :address
  belongs_to :user

  validates :name, :price, :description, presence: true
end
