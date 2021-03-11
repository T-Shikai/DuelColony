class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :end_user_id, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
