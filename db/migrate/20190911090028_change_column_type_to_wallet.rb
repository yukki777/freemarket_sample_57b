class ChangeColumnTypeToWallet < ActiveRecord::Migration[5.2]
  def change
    change_column :wallets, :customer_id, :string, null: false
    change_column :wallets, :card_id, :string, null: false
  end
end
