class RemoveAddressIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :address_id, :integer
  end
end
