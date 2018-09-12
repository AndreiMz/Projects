# frozen_string_literal: true

# default by rails
class HomeController < ApplicationController
  def index
    if Video.count > 6
      rands = (1..Video.last.id).sort{ rand() - 0.5 }[0..5]
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
