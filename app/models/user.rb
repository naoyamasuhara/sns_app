class User < ApplicationRecord
  mount_uploader :profile_image, ProfileImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, on: :create
  has_many :diaries, dependent: :destroy
  has_many :community_partcipants, inverse_of: :user
  has_many :communities, through: :community_partcipants
end