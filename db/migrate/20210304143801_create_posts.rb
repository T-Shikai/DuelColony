class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :end_user_id, null: false
      t.integer :topic_id, null: false
      t.text :content, null: false
      t.string :image_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
