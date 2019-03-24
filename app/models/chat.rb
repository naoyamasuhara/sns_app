class Chat < ApplicationRecord
  validates :title, presence: true
  belongs_to :community
end