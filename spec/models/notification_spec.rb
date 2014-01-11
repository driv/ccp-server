require 'spec_helper'

describe Notification do

		let(:notification) { 
			@user = FactoryGirl.create(:user)
			@subscription_1 = FactoryGirl.create(:subscription, user: @user)
			Notification.new(@user)
		}

		it 'should send notifications' do
			Notificator.any_instance.should_receive(:notify).with('this is a test')

			notification.notify('this is a test')
		end
end