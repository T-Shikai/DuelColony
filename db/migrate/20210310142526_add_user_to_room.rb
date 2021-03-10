class AddUserToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :host_id, :integer
    add_column :rooms, :guest_id, :integer
    add_column :rooms, :finishing, :integer
  end
end
