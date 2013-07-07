class ClipsController < ApplicationController
	def create
	  user = User.find(params[:user_id])
	  @clip = user.clips.build(params[:micropost])

	  if @clip.save
	  	render json: @clip, status: :created, location: user_clip_path(user,@clip)
	  else
	  	render json: @clip.errors, status: :unprocessable_entity
	  end
	end

	def show
		user = User.find(params[:user_id])
		@clip = user.clips.find(params[:id])

		render json: @clip
	end
end