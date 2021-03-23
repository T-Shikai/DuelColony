class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.integer :end_user_id, null: false
      t.integer :tournament_id, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
