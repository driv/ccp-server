class NotificatorFaye < Notificator
	register_notificator :faye

	def notify(payload)
		channel_id = @parameters['channel_id']
		RealtimeWebNotificationsController.publish("/notifications/#{channel_id}", payload)
	end
end