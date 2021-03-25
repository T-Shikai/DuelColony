class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :room_id, null: false
      t.integer :message_id, null: false
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
