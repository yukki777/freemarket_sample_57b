class Category < ApplicationRecord
  self.table_name = "CATEGORIES"

  has_many :products, through: :product_categories
  has_many :product_categories


  has_ancestry

end
