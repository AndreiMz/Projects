# frozen_string_literal: true

# default by rails
class HomeController < ApplicationController
  def index
    if Video.count > 6
      rands = Video.order("RANDOM()").limit(6).ids
      @videos = []
      rands.each do |t|
        begin
        x = Yt::Video.new id: Video.find(t).youtube_id
        @videos << x
      rescue ActiveRecord::RecordNotFound
        next
        end
      end
    end
  end
end
