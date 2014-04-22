class SubscriptionsController < ApplicationController
	def create
		user = User.find(params[:user_id])
		@subscription = user.subscriptions.build(permitted_params)
		@subscription.parameters= params[:subscription][:parameters]

		if @subscription.save!
			render json: @subscription, status: :created, location: user_subscription_path(user, @subscription)
		else
			render json: @subscription.error, status: :unprocessable_entity
		end
	end

	def permitted_params
		params.require(:subscription).permit(:kind)
	end
end