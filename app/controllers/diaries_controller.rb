class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :set_user_diary, only: [:index]

  def index
    @diaries = @user.diaries.page(params[:page]).per(3)
  end
  
  def show
  end
  
  def new
    @diary = current_user.diaries.build
  end
  
  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to user_diary_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to user_diary_path
    else
      render :edit
    end
  end
  
  def destroy
    @diary.destroy
    redirect_to user_diaries_path
  end
  
  private
    def diary_params
      params.require(:diary).permit(:title, :content).merge!(user_id: current_user.id)
    end

    def set_diary
      @diary = current_user.diaries.find(params[:id])
    end

    def set_user_diary
      @user = User.find(params[:user_id])
    end
end