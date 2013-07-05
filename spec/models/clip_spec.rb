require 'spec_helper'

describe Clip do
  before { @clip = FactoryGirl.create :clip }

  subject { @clip }

  it { should respond_to :payload }
  it { should respond_to :user }
end
