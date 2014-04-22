class Notificator


	@@subclasses = {}

	def self.create subscription
		kind = subscription.kind.to_sym
		c = @@subclasses[kind]
		if !c
			c = self
			Rails.logger.warn "Notificator kind not registered: #{kind}"
		end
		c.new(subscription.parameters)
	end

	def initialize(parameters)
		@parameters = parameters
	end

	def notify(payload)
	end

	#private
	def self.register_notificator name
		@@subclasses[name] = self
	end

end