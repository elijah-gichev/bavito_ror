begin
  class CreateRequest < ActiveRecord::Migration[6.1]
    def change
      create_table :requests do |t|
        t.belongs_to :user
        t.bigint :sender_id, null: false
        t.bigint :recipient_id, null: false
        t.bigint :sender_good_id, null: false
        t.bigint :recipient_good_id, null: false
        t.string :comment, null: false
        t.string :status, null: false
        t.timestamps
      end
      add_foreign_key :requests, :users, column: :sender_id
      add_foreign_key :requests, :users, column: :recipient_id
      add_foreign_key :requests, :goods, column: :sender_good_id
      add_foreign_key :requests, :goods, column: :recipient_good_id
      rename_column :requests, :user_id, :creator_id
    end
  end
end
