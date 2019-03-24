class Community < ApplicationRecord
  validates :name, presence: true
  has_many :users, through: :community_partcipants
  has_many :community_partcipants, inverse_of: :community
  has_many :chats
end