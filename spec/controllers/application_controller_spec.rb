require 'spec_helper'

describe ApplicationController do
	describe 'token authentication' do
		describe 'successful' do

		end

		it "passes the token" do
			request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials("test_access1")
			get user_path 
 			assigns(:token).should be "test_access1"
		end
	end
end