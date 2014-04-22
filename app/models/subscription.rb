class Subscription < ActiveRecord::Base
	belongs_to :user
	validates :kind, :parameters, presence: true

	def parameters=(val)
    	write_attribute(:parameters, val.to_json)
	end

	def parameters
		ActiveSupport::JSON.decode(read_attribute(:parameters))
	end
end