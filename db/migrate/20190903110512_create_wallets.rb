class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :customer_id, null: false
      t.string     :card_id,     null: false
      t.timestamps
    end
  end
end
