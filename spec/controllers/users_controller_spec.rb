require 'spec_helper'

describe UsersController do
	describe 'CRUD' do
		describe 'create' do
			let(:user) { User.new(username: "created") }
			let(:response) {  post( :create , user: user.attributes ) }
			
			
			it 'should respond with created(201) http message' do
				response.code.should == "201"
			end
			it 'should increment total users count' do
				expect{ response }.to change{User.count}.by(1)
			end
		end
	end
end
