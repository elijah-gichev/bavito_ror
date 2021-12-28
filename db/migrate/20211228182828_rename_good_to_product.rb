class RenameGoodToProduct < ActiveRecord::Migration[6.1]
  def change
    rename_table :goods, :products
  end
end
