class AddReferencesChat < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :user_id, :integer, foreign_key: true
    add_column :chats, :community_id, :integer, foreign_key: true
  end
end