class CreateCommunityParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :community_participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.boolean :admin, nul: false, default: false

      t.timestamps
    end
  end
end
