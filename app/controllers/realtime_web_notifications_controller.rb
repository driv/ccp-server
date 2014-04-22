class RealtimeWebNotificationsController < FayeRails::Controller
	channel '/notifications/*' do

		monitor :subscribe do
      		Rails.logger.debug "Client #{client_id} subscribed to #{channel}."
    	end

    	filter :in do
	      Rails.logger.debug "Inbound message #{message}."
	      pass
	    end

	    filter :out do
	      Rails.logger.debug "Outbound message #{message}."
	      pass
	    end
	end

	
end