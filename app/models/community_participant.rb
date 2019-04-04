class CommunityParticipant < ApplicationRecord
  belongs_to :user, inverse_of: :community_participants
  belongs_to :community, inverse_of: :community_participants
end
