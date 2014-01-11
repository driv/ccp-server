require 'spec_helper'

describe Notificator do

	class NotificatorTest < Notificator
		register_notificator :test_type

		def notify(payload)
			return nil
		end

		def parameters
			return @parameters
		end
	end

	describe 'NotificatorTest' do
		subject(:notificator) { 			
			subscription = FactoryGirl.build(:subscription, kind: 'test_type')
			Notificator.create(subscription)
		}

		it { should respond_to :notify }
		it { should be_an_instance_of NotificatorTest }
		its(:parameters) { should_not be_nil }

	end
end