# frozen_string_literal: true

# defines crud operations for the Video model
class VideosController < ApplicationController
  def index
    @videos = Video.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    make_params_from_id(video_params[:youtube_id])
    @video = Video.new(@create_params)
    @channels = Channel.all
    if @video.save
      redirect_to video_path(Video.last)
    else
      render 'new'
    end
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to videos_path(@video)
    else
      render 'new'
    end
  end

  def edit
    @video = Video.find(params[:id])
    @channels = Channel.all
  end

  def destroy
    Video.find(params[:id]).destroy
    flash[:success] = 'Video succesfully deleted'
    redirect_to videos_url
  end

  def new
    @video = Video.new
    @channels = Channel.all
  end

  private

  def video_params
    params.require(:video).permit(:title,
                                  :url,
                                  :duration,
                                  :channel_id,
                                  :youtube_id)
  end

  def make_params_from_id(yt_id)
    vid = Yt::Video.new id: yt_id
    @create_params = {
      title: vid.title,
      url: 'https://www.youtube.com/watch?v=' + yt_id,
      duration: vid.length,
      is_hd: vid.hd?,
      youtube_id: yt_id,
      channel_id: video_params[:channel_id]
    }
  end
end
