module PoroHelper
require 'yt'
class YoutubeFetch
	def initialize
	end

	def get_videos_from(channel_id)
		@videos = (Yt::Channel.new id:channel_id).videos
	end

	def get_channel_from_video(video)
		@channel = Yt::Channel.new id:(video.channel_id)
	end

	def youtube_object_to_record(yt)
		record = {
			title: yt.title,
			url: "https://www.youtube.com/watch?v=" +yt.id.to_s,
			duration: yt.length,
			is_hd: yt.hd?,
			channel_id: Channel.where(youtube_id: yt.channel_id).first.id,
			youtube_id: yt.id
		}
	end
	
end
end