class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]
  before_action :set_community
  
  def index
    @chats = @community.chats.page(params[:page]).per(3)
  end
  
  def show
  end
  
  def new
    @chat = @community.chats.build
  end
  
  def create
    @chat = @community.chats.build(chat_params)
    if @chat.save
      redirect_to community_path(@community)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @chat.update(chat_params)
      redirect_to community_chat_path(@community)
    else
      render :edit
    end
  end
  
  def destroy
    @chat.destroy
    redirect_to community_path(@community)
  end
 
private

  def chat_params
    params.require(:chat).permit(:title, :description).merge!(user_id: current_user.id)
  end
  
  def set_chat
    @chat = Chat.find(params[:id])
  end
  
  def set_community
    @community = Community.find(params[:community_id])
  end

end