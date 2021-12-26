class CreateGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :goods do |t|
      t.belongs_to :user
      t.text :description, null: false
      t.string :image_url, null: false
      t.string :title, null: false
      t.integer :points, null: false
      t.timestamps
    end
  end
end
