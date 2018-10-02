# frozen_string_literal: true

# defines methods used by users who are signed in
# so that only them can view favorite channels
class FavoritesController < ApplicationController
  before_action :check_user
  
  def autocomplete_videos
    @videos = Video.all
    respond_to do |format|
      format.json { render json: @videos.to_json }
    end
  end

  def index
    action :authenticate_user! unless user_signed_in?
    vdids = Favorite.where(user_id: current_user.id).pluck(:video_id)
    chids = Favorite.where(user_id: current_user.id).pluck(:channel_id)
    @videos = Video.where(channel_id: chids).or(Video.where(id: vdids))
    @videos = @videos.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.json {render json:@videos}
    end
  end

  def list
    @all_favs = Hash.new
    User.where.not(id: current_user.id).each do |u|
      @all_favs[u.id] = Favorite.where(user_id: u.id)
    end
  end

  def view
    @user_favs = Video.where(channel_id: Favorite.where(user_id: params[:uid]).pluck(:channel_id)).or(
                 Video.where(id: Favorite.where(user_id: params[:uid]).pluck(:video_id))).
                 paginate(page: params[:page], per_page: 10)
  end

  def new
    @favorite = Favorite.new
    @v = Video.pluck(:id,:title)
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
    puts params[:video_id]
    @favorite = Favorite.new(channel_id: users_params[:channel_id],
                          video_id: users_params[:video_id],
                          user_id: current_user.id)
    check_save
  end

  private

  def users_params
    params.require(:favorite).permit(:channel_id, :video_title, :video_id, :uid)
  end

  def check_user
    unless params[:username].nil?
      unless current_user.username == params[:username]
        flash[:notice] = 'You cannot modify other user\'s favorites'
        redirect_to root_url
      end
    end
  end

  def check_save
    unless @favorite.errors.any?
      redirect_to favorites_path
    else
      @channels = Channel.all
      @errors = @favorite.errors
      render :new
    end
  end
end
