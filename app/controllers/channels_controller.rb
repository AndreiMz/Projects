# frozen_string_literal: true

# defined CRUD operations for manipulating data from the DB and from the views
# also extra show as iframe for the embedded view
class ChannelsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:new,:edit]
  def index
    @channels = Channel.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @channel = Channel.new
    @videos = Video.all
  end

  def create
    @channel = Channel.new(channel_params.except(:videos))
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
    @videos.paginate(page: params[:page], per_page: 5)
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
end
