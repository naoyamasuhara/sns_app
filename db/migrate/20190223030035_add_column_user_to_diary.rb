class AddColumnUserToDiary < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :user_id, :bigint
  end
end