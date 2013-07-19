class ApplicationController < ActionController::API

	include ActionController::HttpAuthentication::Token::ControllerMethods

	before_filter :restrict_access

	private
	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
			check_token token
		end
	end

	def check_token(token)
		Session.exists?(access_token: token)
	end
	
end
