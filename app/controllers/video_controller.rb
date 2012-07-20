class VideoController < ApplicationController
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(params[:video])
    @video.save!
    flash[:saved] = "Your video has been saved"
    redirect_to new_video_url
  end
  
  def index
    @videos = Video.all
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:saved] = "Your video has been deleted"
    redirect_to :action => :index
  end
end