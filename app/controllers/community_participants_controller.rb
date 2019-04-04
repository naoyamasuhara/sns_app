class CommunityParticipantsController < ApplicationController
  before_action :require_community_admin_user!
  before_action :set_community, only: [:index, :update]

  def index
    @users = @community.users.order(id: :desc)
  end

  def update
    @community_participant = @community.community_participants.find(params[:id])
    @community_participant.update!(admin: true)
    redirect_to community_community_participants_path(@community)
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end

  def require_community_admin_user!
    redirect_to root_path unless Community.find(params[:community_id]).admin_user?(current_user)
  end
end
