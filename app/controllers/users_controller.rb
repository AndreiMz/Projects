# frozen_string_literal: true

# defines methods used by users who are signed in
# so that only them can view favorite channels
class UsersController < ApplicationController
  before_action :fetch_favorite_channel_ids, only: [:favorite_page]

  def favorite_page
    action :authenticate_user! unless user_signed_in?
    @fav_channels = Channel.where(youtube_id: @ids)
    @videos = Video.all.paginate(page: params[:page], per_page: 5)
    render 'index'
  end

  def new_favorite
    @favch = Favorite.new
    @channels = Channel.all
    render 'new'
  end

  def create_favorite
    if Favorite.exists?(id_channel: params['favorite']['id_channel'],
                        id_user: current_user.id)
      new_favorite
    else
      @preference = Favorite.new(id_channel: params['favorite']['id_channel'],
                                 id_user: current_user.id)
      check_save
    end
  end

  private

  def users_params
    params.require(:users).permit(:id_channel)
  end

  def fetch_favorite_channel_ids
    @ids = []
    chids = Favorite.where(id_user: current_user.id)
    chids.each { |ch| @ids << ch['id_channel'] }
    @ids
  end

  def check_save
    if @preference.save!
      redirect_to favorites_path
    else
      render 'new'
    end
  end
end
