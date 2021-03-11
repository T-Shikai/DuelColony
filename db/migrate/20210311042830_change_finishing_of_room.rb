class ChangeFinishingOfRoom < ActiveRecord::Migration[5.2]
  def up
    change_column :rooms, :finishing, :integer, default: 0
  end

  def down
    change_column :rooms, :finishing, :integer
  end
end
