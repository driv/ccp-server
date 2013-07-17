require 'spec_helper'

describe SessionsController do

	describe 'create' do

		let(:user) { FactoryGirl.create(:user) }

		def create_session(username, password)
			post( :create , username: username, password: password)
		end

		describe 'successful authentication' do

			describe 'response' do
				before { create_session user.username, user.password }

				it 'should respond with created(201) http message' do
					response.code.should == "201"
				end

				it 'should contain the accesstoken' do
					parsed = JSON.parse(response.body)
					parsed['access_token'].should_not be_empty
				end


			end

			it 'should increment total sessions count' do
				expect{ create_session user.username, user.password }.to change{Session.count}.by(1)
			end

		end

		describe 'unsuccessful authentication' do

			it 'should not create session when username is wrong' do
				create_session 'wrong_user', user.password
				response.code.should == "422"
			end

			it 'should not create session when password is wrong' do
				create_session user.username, 'password'
				response.code.should == "422"
			end
		end
	end

end
