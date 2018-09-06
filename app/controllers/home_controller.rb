# frozen_string_literal: true

# default by rails
class HomeController < ApplicationController
  def index
    if Video.count > 12
      rands = Array.new(12) { rand(1..Video.last.id) }
      @videos = []
      rands.each do |t|
        x = Yt::Video.new id: Video.find(t).youtube_id
        @videos << x
      end
    end
  end
end
