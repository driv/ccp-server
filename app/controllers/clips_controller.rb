class ClipsController < ApplicationController
	def create
	  user = User.find(params[:user_id])	  
	  @clip = user.clips.build(params[:clip])

	  if @clip.save
	  	location = user_clip_path(user,@clip)
	  	notify(user, location)
	  	render json: @clip, status: :created, location: location
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

	private
	def find_last_clip(user)
		user.clips.order('created_at DESC').first
	end

	def notify(user, payload)
		notification = Notification.new(user)
		notification.notify(payload)
	end
end