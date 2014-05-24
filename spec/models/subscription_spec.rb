require 'spec_helper'

describe Subscription do

	describe 'Accessors' do
		subject(:subscription) { FactoryGirl.build(:subscription) }

		it { should respond_to :user }
		it { should respond_to :parameters }
		it { should respond_to :kind }

		it { should be_valid }
	end

	describe 'should not allow empty parameters' do
		subject(:subscription) { FactoryGirl.build(:subscription, parameters: {}) }

		it { should_not be_valid }
	end

	describe 'should not allow nil parameters' do
		subject(:subscription) {
				subscription = FactoryGirl.build(:subscription)
				subscription.parameters= nil
				return subscription
		}

		its (:parameters) { should be_nil }

		it { should_not be_valid }
	end

	describe 'write and read' do
		parameters = {"url" => 'http://test.com/test', "key" => 'test_key'}
		let(:subscription) { FactoryGirl.create(:subscription, parameters: parameters) }
		it 'should preserve parameters' do
			subscription_recovered = Subscription.find(subscription.id)

			subscription_recovered.parameters.should eq subscription.parameters

			subscription_recovered.parameters.should_not be subscription.parameters
		end

		it 'should recover parameters as hash' do
			subscription_recovered = Subscription.find(subscription.id)

			subscription_recovered.parameters["url"].should eq parameters["url"]
		end
	end

	
end