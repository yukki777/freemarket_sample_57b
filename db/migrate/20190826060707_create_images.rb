class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string     :image_url,  null: false
      t.references :product

      t.timestamps
    end
    
    add_foreign_key :products
  end
end
