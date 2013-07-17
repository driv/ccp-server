require 'spec_helper'

describe UsersController do
	describe 'CRUD' do
		describe 'create' do
			let(:user) { FactoryGirl.build(:user) }	

			def create_user(user)
			  post( :create , user: user.attributes )
			end
			
			it 'should respond with created(201) http message' do
				create_user user
				response.code.should == "201"
			end
			it 'should increment total users count' do
				expect{ create_user user }.to change{User.count}.by(1)
			end
		end
	end
end
