class Community < ApplicationRecord
  validates :name, presence: true
  has_many :community_partcipants, inverse_of: :community
  has_many :users, through: :community_partcipants
  has_many :chats
  
  after_create :update_admin_authority
  
  def update_admin_authority
    community_partcipant = self.community_partcipants.first
    community_partcipant.update_column(:admin, true)
  end
  
  def admin_user?(user)
    CommunityPartcipant.exists?(user_id: user.id, community_id: self.id, admin: true)
  end
end