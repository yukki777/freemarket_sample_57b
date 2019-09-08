class Category < ApplicationRecord
  has_many :products, through: :product_categories
  has_many :product_categories


  has_ancestry

  validates :category, presence: true
end
