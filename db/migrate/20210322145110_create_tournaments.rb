class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.integer :end_user_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.text :result
      t.integer :max, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
