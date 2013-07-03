require 'spec_helper'

describe User do

	before { @user = FactoryGirl.create(:user) }
  
	subject { @user }

	it { should respond_to :username }

end
