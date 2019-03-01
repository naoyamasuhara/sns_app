class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = Diary.page(params[:page]).per(3)
  end
  
  def show
  end
  
  def new
    @diary = current_user.diaries.build
  end
  
  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to diaries_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to @diary
    else
      render :edit
    end
  end
  
  def destroy
    @diary.destroy
    redirect_to diaries_path
  end
  
  private
    def diary_params
      params.require(:diary).permit(:title, :content, :profile_image)
    end
    
    def set_diary
      @diary = current_user.diaries.find(params[:id])
    end
end