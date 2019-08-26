class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,          null: false
      t.string  :city,                 null: false
      t.string  :address,              null: false
      t.string  :building_name
      t.string  :building_phone_number
      t.integer :prefecture,           null:false

      t.timestamps
    end
  end
end
