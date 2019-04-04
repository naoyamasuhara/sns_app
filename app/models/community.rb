class Community < ApplicationRecord
  validates :name, presence: true
  has_many :community_participants, inverse_of: :community
  has_many :users, through: :community_participants
  has_many :chats

  # communityが作成されたら呼ばれる関数を登録
  # rails callbackでググると出てきます。
  after_create :update_admin_authority

  # callbackで呼ばれる関数
  def update_admin_authority
    # selfは今回作成されたcommunityのインスタンス
    community_participant = self.community_participants.first
    # 今回作成されたcommunityのcommunity_participantインスタンスのadminカラムをtrueに変える処理
    community_participant.update_column(:admin, true)
  end

  def admin_user?(user)
    CommunityParticipant.exists?(user_id: user.id, community_id: self.id, admin: true)
  end
end