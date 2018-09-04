# frozen_string_literal: true

# defined CRUD operations for manipulating data from the DB and from the views
# also extra show as iframe for the embedded view
class ChannelsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new edit destroy]

  def index
    @channels = Channel.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @channel = Channel.new
    @videos = Video.all
  end

  def create
    make_params_from_id(channel_params[:youtube_id])
    @channel = Channel.new(@new_params)
    append_vids(channel_params[:videos]) unless channel_params[:videos].nil?
    if @channel.save
      redirect_to @channel
    else
      render 'new'
    end
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update(channel_params)
      redirect_to channels_path(@channel)
    else
      render 'edit'
    end
  end

  def destroy
    Channel.find(params[:id]).destroy
    flash[:success] = 'Channel deleted succesfully'
    redirect_to channels_url
  end

  def edit
    @channel = Channel.find(params[:id])
    @videos = Video.all
  end

  def show
    @channel = Channel.find(params[:id])
    @videos = Video.all
  end

  def show_iframe
    @channel = Channel.find(params[:id])
    @videos = Video.where(channel_id: @channel.id)
    @videos = @videos.paginate(page: params[:page], per_page: 5)
  end

  private

  def append_vids(vids)
    vids.each { |vid| @channel.videos.append(Video.find(vid)) }
  end

  def channel_params
    params.require(:channel).permit(:name,
                                    :channel_url,
                                    :youtube_id,
                                    videos: [])
  end

  def make_params_from_id(yt_id)
    ch = Yt::Channel.new id: yt_id
    @new_params = {
      channel_url: 'https://www.youtube.com/' + yt_id,
      name: ch.title,
      youtube_id: yt_id
    }
  end
end
