class CommunityPartcipant < ApplicationRecord
  belongs_to :user, inverse_of: :community_partcipants
  belongs_to :community, inverse_of: :community_partcipants
end