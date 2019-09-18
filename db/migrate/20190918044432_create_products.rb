class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string      :name,                null: false
      t.integer     :price,               null: false
      t.text        :description,         null: false
      t.references  :user,                null: false, foreign_key: true
      t.references  :category,            null: false, foreign_key: true
      t.integer     :brand_id
      t.integer     :postage_id,          null: false
      t.integer     :shipping_method_id,  null: false
      t.integer     :shipping_date_id,    null: false
      t.integer     :size_id,             null: false
      t.integer     :condition_id,        null: false
      t.integer     :prefecture_id,       null: false
      t.timestamps
    end
  end
end
