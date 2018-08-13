class VideosController < ApplicationController

	def index
		@videos = Video.all.paginate(page: params[:page],per_page: 10)
	end

	def show
		@video = Video.find(params[:id])
	end
	
	def create
		@video = Video.new(video_params)
		@channels = Channel.all
		if @video.save!
			redirect_to @video
		else

			render 'new'
		end
	end

	def update
		@video = Video.find(params[:id])
		if(@video.update(video_params))
			redirect_to videos_path(@video)
		else
			render 'new'
		end
	end

	def edit
		@video = Video.find(params[:id])
		@channels = Channel.all
	
	end

	def destroy
	 	Video.find(params[:id]).destroy
		flash[:success] = "Video succesfully deleted"
		redirect_to videos_url
	end
	

	def new
		@video = Video.new
		@channels = Channel.all
	end

	private

		def video_params
			params.require(:video).permit(:title,:url,:max_quality,:duration,:channel_id)
		end
end
