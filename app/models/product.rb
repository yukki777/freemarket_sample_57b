class Product < ApplicationRecord
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_many   :product_categories
  has_many   :categories, through: :product_categories
  belongs_to :user

  # validates :name, :description, :price, :condition_id, :postage_id, :shipping_method_id, :shipping_date_id, :prefecture_id, presence: true
end