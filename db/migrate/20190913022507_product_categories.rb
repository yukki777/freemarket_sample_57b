class ProductCategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_categories
  end
end
