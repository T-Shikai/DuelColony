class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :end_user_id, null: false
      t.text :title, null: false
      t.boolean :is_private, default: false
      t.boolean :is_deleted, default: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
