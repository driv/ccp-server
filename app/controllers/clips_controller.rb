class ClipsController < ApplicationController
	def create
	  user = User.find(params[:user_id])
	  p params[:clip]
	  @clip = user.clips.build(params[:clip])
	  p @clip

	  if @clip.save
	  	render json: @clip, status: :created, location: user_clip_path(user,@clip)
	  else
	  	render json: @clip.errors, status: :unprocessable_entity
	  end
	end

	def show
		user = User.find(params[:user_id])
		clip_id = params[:id]
		if clip_id == 'last' then
			@clip = find_last_clip(user)
		else
			@clip = user.clips.find(clip_id)
		end
		render json: @clip
	end

	def find_last_clip(user)
		user.clips.order('created_at DESC').first
	end
end