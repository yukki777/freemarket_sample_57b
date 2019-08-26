class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,          null: false
      t.integer    :postage,       null: false
      t.integer    :price,         null: false
      t.text       :description,   null: false
      t.string     :status,        null: false
      t.string     :shipping_date, null: false
      t.references :address
      t.references :category

      t.timestamps
    end

    add_foreign_key :addresses, :categories
  end
end
