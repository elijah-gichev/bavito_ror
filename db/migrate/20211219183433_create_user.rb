class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :name, null: false
      t.string :phone, unique: true, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end