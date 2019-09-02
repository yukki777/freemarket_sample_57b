class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :brand_id, :integer
    add_column :products, :postage_id, :integer, null: false
    add_column :products, :shipping_method_id, :integer, null: false
    add_column :products, :size_id, :integer, null: false
    add_column :products, :shipping_date_id, :integer, null: false
    add_column :products, :condition_id, :integer, null: false
  end
end
