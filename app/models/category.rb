class Category < ApplicationRecord
  belongs_to :products
  has_ancestry

end
