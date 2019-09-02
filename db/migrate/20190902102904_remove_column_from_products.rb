class RemoveColumnFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :postage, :integer
    remove_column :products, :status, :string
    remove_column :products, :shipping_date, :string
    remove_reference :products, :category, foreign_key: true
  end
end
