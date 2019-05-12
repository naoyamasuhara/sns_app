class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  def index
    @communities = Community.order(id: :desc).page(params[:page]).per(3)
  end
  
  def new
    @community = current_user.communities.build
  end
  
  def create
    @community = current_user.communities.build(community_params)
    if @community.save
      redirect_to communities_path
    else
      render :new
    end
  end
  
  def show
    @community_partcipant = @community.community_partcipants.find_by(user_id: current_user.id)
  end
  
  def edit
  end
  
  def update
    if @community.update(community_params)
      redirect_to @community
    else
      render :edit
    end
  end
  
  def destroy
    @community.destroy
    redirect_to communities_path
  end
  
  private
  
  def community_params
    params.require(:community).permit(:name, :description)
  end
    
  def set_community
    @community = Community.find(params[:id])
  end
  
end
