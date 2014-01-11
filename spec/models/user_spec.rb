require 'spec_helper'

describe User do

	before { @user = FactoryGirl.build(:user) }
  
	subject { @user }

	it { should be_valid }
	it { should respond_to :username }
	it { should respond_to :clips }
	it { should respond_to :subscriptions }

	it "should not allow empty username" do
		user = FactoryGirl.build(:user, username: "")
		user.should_not be_valid
	end

	it "should not allow empty password" do
		user = FactoryGirl.build(:user, password: "")
		user.should_not be_valid
	end

end
