require "#{Rails.root}/app/helpers/poro_helper"
include PoroHelper

namespace :grab_vids do
  desc 'Updating data for the db'
  task grab_data: :environment do
    channels = Channel.all
    a = YoutubeFetch.new
    Yt.configure do |config|
      config.log_level = :debug
    end
    Yt.configuration.api_key = 'AIzaSyBHuSdJkeHGWxnCFqqhNrzguLmeXy6UkWg'

    channels.each do |ch|
      videos_new = a.get_videos_from(ch.youtube_id)
      videos_new.each do |v|
        unless Video.exists?(title: v.title)
          new_entry = a.youtube_object_to_record(v)
          Video.create!(new_entry)
        end
      end
      # check current titles, if there isn't a title create entry
    end
  end
end
