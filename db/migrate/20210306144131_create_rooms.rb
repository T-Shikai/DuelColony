class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
