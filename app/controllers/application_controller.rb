class ApplicationController < ActionController::API

	include ActionController::HttpAuthentication::Token::ControllerMethods

	before_filter :authenticate, :authorize

	private
	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			check_token token
		end
	end

	def check_token(token)
		session = Session.find_by access_token: token
		@current_user_id = session.user_id if session
		return session
	end

	def authorize
		if @current_user_id
			user_id = (params[:user_id] || params[:id]).to_i
			if @current_user_id != user_id && user_id > 0
				render json: "", status: :unauthorized
			end
		end
	end
	
end
