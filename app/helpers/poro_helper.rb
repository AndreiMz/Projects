# frozen_string_literal: true

# Module PoroHelper used to define functions for rake task
# where the database is updated by fetching new videos
# from the channels on YouTube
module PoroHelper
  require 'yt'

  # Class has methods to transform yt_obj to database record hash
  # and to get videos or channels from either
  class YoutubeFetch
    def initialize; end

    def get_videos_from(channel_id)
      (Yt::Channel.new id: channel_id).videos
    end

    def get_channel_from_video(video)
      Yt::Channel.new id: video.channel_id
    end

    def youtube_object_to_record(yt_obj)
      {
        title: yt_obj.title,
        url: 'https://www.youtube.com/watch?v=' + yt_obj.id.to_s,
        duration: yt_obj.length,
        is_hd: yt_obj.hd?,
        channel_id: Channel.where(youtube_id: yt_obj.channel_id).first.id,
        youtube_id: yt_obj.id
      }
    end
  end
end
