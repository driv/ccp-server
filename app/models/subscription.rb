class Subscription < ActiveRecord::Base
	belongs_to :user
	validates :kind, :parameters, presence: true

	def parameters=(parameters)
		@parameters = parameters.to_json
    	write_attribute(:parameters, @parameters)
	end

	def parameters
		data = read_attribute(:parameters)
		ActiveSupport::JSON.decode(data)
	end
end