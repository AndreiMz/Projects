# frozen_string_literal: true

# defines methods used by users who are signed in
# so that only them can view favorite channels
class UsersController < ApplicationController
  def favorite_page
    if user_signed_in?
      chids = Favorite.where(id_user: current_user.id)
      ids = []
      chids.each do |ch|
        ids << ch['id_channel']
      end
      @favChannels = Channel.where(youtube_id: ids)
      @videos = Video.all
      @videos.paginate(page: params[:page], per_page: 5)
      render 'index'
    else
      action :authenticate_user!
    end
  end

  def new_favorite
    @favch = Favorite.new
    @channels = Channel.all
    render 'new'
  end

  def create_favorite
    if Favorite.exists?(id_channel: params['favorite']['id_channel'],
                        id_user: current_user.id)
      @favch = Favorite.new
      @channels = Channel.all
      render 'new'
    else
      @preference = Favorite.new(id_channel: params['favorite']['id_channel'],
                                 id_user: current_user.id)
      if @preference.save!
        redirect_to favorites_path
      else
        render 'new'
      end
    end
  end

  private

  def users_params
    params.require(:users).permit(:id_channel)
  end
end
