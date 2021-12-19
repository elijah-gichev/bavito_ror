=begin
class CreateRequest < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.belongs_to :user, class_name: 'User', foreign_key: "user_from_id"
      t.belongs_to :user, class_name: 'User', foreign_key: "user_to_id"
      t.belongs_to :goods, foreign_key: "good_from_id"
      t.belongs_to :goods, foreign_key: "good_to_id"
      t.string :comment, null: false
      t.string :status, null: false
      t.timestamps
    end
  end
end
=end
