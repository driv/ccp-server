class SessionsController < ApplicationController

	def create
		username = params[:username]
		password = params[:password]

		user = User.find_by_username username
		if user && user.password == password
			@session = Session.new(user_id: user.id, access_token: generate_token)
			@session.save
			render json: @session, status: :created
		else
			render json: "", status: :unprocessable_entity
		end
	end


	protected

	def generate_token
		loop do
		  random_token = SecureRandom.urlsafe_base64(nil, false)
		  break random_token unless Session.where(access_token: random_token).exists?
		end
	end

end
