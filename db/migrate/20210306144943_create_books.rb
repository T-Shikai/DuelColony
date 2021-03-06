class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :end_user_id, null: false
      t.integer :topic_id, null: false

      t.timestamps
    end
  end
end
