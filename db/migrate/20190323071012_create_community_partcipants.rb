class CreateCommunityPartcipants < ActiveRecord::Migration[5.2]
  def change
    create_table :community_partcipants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.boolean :admin, null: false, default: false
      t.timestamps
    end
  end
end