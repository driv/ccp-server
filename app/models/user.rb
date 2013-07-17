class User < ActiveRecord::Base
	has_many :clips

	validates :username, :password , presence: true
end
