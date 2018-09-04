# frozen_string_literal: true

# defines methods used by users who are signed in
# so that only them can view favorite channels
class UsersController < ApplicationController
  before_action :fetch_favorite_channel_ids, only: [:favorite_page]

  def favorite_page
    action :authenticate_user! unless user_signed_in?
    @fav_channels = Channel.where(id: @ids)
    @videos = Video.where(channel_id: @ids)
    @videos = @videos.paginate(page: params[:page], per_page: 10)
    render 'index'
  end

  def new_favorite
    @favch = Favorite.new
    @channels = Channel.all
    render 'new'
  end

  def create_favorite
    @favch = Favorite.new(channel_id: users_params[:channel_id],
                          user_id: current_user.id)
    check_save
  end

  private

  def users_params
    params.require(:favorite).permit(:channel_id)
  end

  def fetch_favorite_channel_ids
    @ids = []
    Favorite.where(user_id: current_user.id).each do |ch|
      @ids << ch['channel_id']
    end
    @ids
  end

  def check_save
    if @favch.save
      redirect_to favorites_path
    else
      @channels = Channel.all
      @errors = @favch.errors
      render :new
    end
  end
end
