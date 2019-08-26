class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :name,          null: false
      t.integer :postage,       null: false
      t.integer :price,         null: false
      t.text    :description,   null: false
      t.string  :status,        null: false
      t.strin   :shipping_date, null: false
      t.integer :address_id,    foreign_key: true
      t.integer :category_id,   foreign_key: true

      t.timestamps
    end
  end
end
