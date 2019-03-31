class CommunityPartcipantsController < ApplicationController
  before_action :set_community_partcipant, only: [:destroy]
  before_action :set_community
  
  def new
    @community_participant = current_user.community_partcipants.build
  end
  
  def create
    @community_partcipant = current_user.community_partcipants.build(community_partcipant_params)
    redirect_to community_path(@community)
  end
  
  def destroy
    @community_participant.destroy
    redirect_to community_path(@community)
  end
  
  private
    def community_partcipant_params
      params_require(:community_partcipant).permit(:community_id, user_id: :current_user_id)
    end
    
    def set_community_partcipant
      @community_partcipant = Community_partcipant.find(params[:id])
    end
    
    def set_community
      @community = Community.find(params[:community_id])
    end
end