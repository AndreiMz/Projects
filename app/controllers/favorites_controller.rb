# frozen_string_literal: true

# defines methods used by users who are signed in
# so that only them can view favorite channels
class FavoritesController < ApplicationController
  before_action :check_user
  autocomplete :video, :title, full: true

  def autocomplete_videos
    @videos = Video.all
    respond_to do |format|
      format.json { render json: @videos.to_json }
    end
  end
  def index
    action :authenticate_user! unless user_signed_in?
    ids = Favorite.where(user_id: current_user.id).pluck('channel_id')
    @fav_channels = Channel.where(id: ids)
    @vids = Video.pluck(:title,:id)
    @videos = Video.where(channel_id: ids)
    @videos = @videos.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.json {render json:@vids}
    end
  end

  def new
    @favch = Favorite.new
    @channels = Channel.all
    @videos = Video.all
    @vids = Video.pluck(:title,:id)
    render 'new'
  end

  def destroy
    Favorite.find(users_params[:id]).destroy
  end

  def edit_all
    @favs = Favorite.where(user_id: current_user.id)
    render 'edit'
  end

  def create
    @favch = Favorite.new(channel_id: users_params[:channel_id],
                          video_id: users_params[:video_id],
                          user_id: current_user.id)
    check_save
  end

  private

  def users_params
    params.require(:favorite).permit(:channel_id)
  end

  def check_user
    unless current_user.username == params[:username]
      flash[:notice] = 'You cannot modify other user\'s favorites'
      redirect_to root_url
    end
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
