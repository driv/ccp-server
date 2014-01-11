class SubscriptionsController < ApplicationController
	def create
		user = User.find(params[:user_id])

		@subscription = user.subscriptions.build(params[:subscription])

		if @subscription.save
			render json: @subscription, status: :created, location: user_subscription_path(user, @subscription)
		else
			render json: @subscription.error, status: :unprocessable_entity
		end
	end
end