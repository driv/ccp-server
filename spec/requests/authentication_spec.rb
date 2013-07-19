require 'spec_helper'

describe "Authentication" do
  token = "ABCDEF0123456789"

  let!(:session) { FactoryGirl.create(:session, access_token: token)}

  before do
    ApplicationController.any_instance.unstub(:restrict_access)
  end

  describe "Passing token" do
    it "should respond 200" do
      get users_path, nil, authorization: %Q(Token token="#{token}")
      expect(response.status).to eq(200)
    end
  end

  describe "Passing wrong token" do

  	before do 
  		get users_path, nil, authorization: %Q(Token token="wrong_token")
  	end

  	it "should respond 401" do
  		response.status.should be 401
  	end

  	it "should have an empty response" do
  		response.body.should be_empty
  	end
  end


  describe "Creating new session" do
    let(:user) { FactoryGirl.create(:user) }

    it 'should skip authentication' do
      post sessions_path, username: user.username, password: user.password
      response.status.should be 201
    end
  end
end
