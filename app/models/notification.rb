class Notification

	def initialize(user)
		@user = user
	end

	def notify(payload)
		subscriptions = @user.subscriptions.to_a
		subscriptions.each { |subscription|
			notificator = Notificator.create(subscription)
			notificator.notify(payload)
		}
	end
end