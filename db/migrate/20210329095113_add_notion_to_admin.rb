class AddNotionToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :notion, :text
  end
end
