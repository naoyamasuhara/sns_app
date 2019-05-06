class CommunityPartcipantsController < ApplicationController
  before_action :set_community
  before_action :set_community_partcipant, only: [:destroy]
  before_action :require_community_admin_user!, only: [:index, :update]

  def index
    @users = @community.users.order(id: :desc)
  end
  
  def show
    @community_participant = @comumunity.community_participants.find_by(user_id: current_user.id)
  end
  
  def create
    @community_partcipant = current_user.community_partcipants.build(community_id: params[:community_id])
    @community_partcipant.save!
    redirect_to community_path(@community)
  end
  
  def destroy
    @community_partcipant.destroy!
    redirect_to community_path(@community)
  end
  
  def update
    @community_partcipant = @community.community_partcipants.find(params[:id])
    @community_partcipant.update!(admin: true)
    redirect_to community_community_partcipants_path(@community)
  end
  
  private
  
  def set_community_partcipant
    @community_partcipant = CommunityPartcipant.find(params[:id])
  end
  
  def set_community
    @community = Community.find(params[:community_id])
  end
  
  def require_community_admin_user!
    redirect_to root_path unless Community.find(params[:community_id]).admin_user?(current_user)
  end
end