require 'spec_helper'

describe SubscriptionsController do
	describe 'CRUD' do

		def create_subscription(subscription) 
			post( :create , user_id: subscription.user.id, subscription: subscription.attributes ) 
		end

		describe 'create' do
			let(:subscription) { FactoryGirl.build(:subscription) }

			it 'should respond with created(201) http status' do
			  	create_subscription subscription
			  	expect(response.code).to eq '201'
			end

			it 'should insert the subscription in the database' do
				expect { create_subscription subscription }.to change{ subscription.user.subscriptions.count }.by 1
			end
		end
	end	
end