class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]
  
  def index
    @chats = Chat.page(params[:page]).per(3)
  end
  
  def show
  end
  
  def new
    @chat = Chat.new
  end
  
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @chat.update(chat_params)
      redirect_to @chat
    else
      render :edit
    end
  end
  
  def destroy
    @chat.destroy
    redirect_to chats_path
  end
 
private

  def chat_params
    params.require(:chat).permit(:title, :description)
  end
  
  def set_chat
    @chat = Chat.find(params[:id])
  end
end
