class NotificatorFaye < Notificator
	register_notificator :faye

	def notify(payload)
		puts "Notifying with: #{payload}"
		channel_id = [@parameters['channel_id']]
		puts RealtimeWebNotificationsController.publish("/notifications/#{channel_id}", payload)
	end
end