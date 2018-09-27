class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(username: params[:username])
    unless @user.nil? 
      render :show
    else
      redirect_to root_url
    end
  end
  
end