require 'spec_helper'

describe Session do
  
  subject(:session) { FactoryGirl.create(:session) }

  it { should respond_to :user }
  it { should respond_to :access_token }

end
