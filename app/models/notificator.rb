class Notificator

	@@subclasses = {}

	def self.create subscription
		kind = subscription.kind.to_sym
		c = @@subclasses[kind]
		if c
			c.new(subscription.parameters)
		else
			self.new(subscription.parameters)
		end
	end

	def initialize(parameters)
		@parameters = parameters;
	end

	def notify(payload)
	end 

	#private
	def self.register_notificator name
		@@subclasses[name] = self
	end

end