class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  def index
    @communities = Community.order(id: :desc).page(params[:page]).per(3)
  end
  
  def new
    @community = current_user.build
  end
  
  def create
    @community = current_user.build(community_params)
    if @community.save
      flash[:success] = "「#{@community.name}」を登録しました。"
      redirect_to communities_path
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @community.update(community_params)
      flash[:success] = "「#{@community.name}」を更新しました。"
      redirect_to @community
    else
      render :edit
    end
  end
  
  def destroy
    @community.destroy
    flash[:danger] = "「#{@community.name}を削除しました」"
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
