class RenameImageColumnToImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :Image, :image
  end
end
