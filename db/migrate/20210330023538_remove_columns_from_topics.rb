class RemoveColumnsFromTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :is_private, :boolean
    remove_column :topics, :status, :integer
  end
end
