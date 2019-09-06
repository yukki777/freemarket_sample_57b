class ChangeBirthdayToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birthday, :date, null: true
  end
end
