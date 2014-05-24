class RealtimeWebNotificationsController < FayeRails::Controller
	channel '/notifications/*' do

		monitor :subscribe do
			Rails.logger.debug "Client #{client_id} subscribed to #{channel}."
		end

		monitor :unsubscribe do
			Rails.logger.debug "Client #{client_id} unsubscribed from #{channel}."
		end

		filter :in do

			def correct_token?(token)
				Session.find_by access_token: token if token
			end

			block if subscribing? and not correct_token? message['token']
			pass
		end

		filter :out do
			Rails.logger.debug "Outbound message #{message}."
			pass
		end
	end


end