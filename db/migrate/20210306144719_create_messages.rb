class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :end_user_id, null: false
      t.integer :room_id, null: false
      t.text :content, null: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
